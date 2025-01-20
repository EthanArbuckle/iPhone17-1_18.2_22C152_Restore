@interface AVButton
+ (AVButton)buttonWithAccessibilityIdentifier:(id)a3 accessibilityLabel:(id)a4 isSecondGeneration:(BOOL)a5;
+ (AVButton)buttonWithAccessibilityIdentifier:(id)a3 isSecondGeneration:(BOOL)a4;
+ (id)customHighlightedAnimationButtonWithAccessibilityIdentifier:(id)a3;
- (AVButtonDelegate)delegate;
- (AVLayoutItemAttributes)layoutAttributes;
- (AVMicaPackage)micaPackage;
- (AVUserInteractionObserverGestureRecognizer)userInteractionGestureRecognizer;
- (BOOL)appliesTransformToImageViewWhenHighlighted;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)clampsHitRectInsetsWhenContainedInScrollableView;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)disablesHighlightWhenLongPressed;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isButtonOverVideo;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (BOOL)isSecondGeneration;
- (BOOL)multipleTouchesEndsTracking;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)treatsForcePressAsLongPress;
- (BOOL)usesBackgroundEffectViewForTextOnlyButtons;
- (BOOL)wasForcePressTriggered;
- (BOOL)wasLongPressed;
- (CGRect)contentIntersection;
- (CGRect)hitRect;
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (NSDirectionalEdgeInsets)hitRectInsets;
- (NSNumber)previousHorizontalPositionOfLongPress;
- (NSString)activeImageName;
- (NSString)alternateImageName;
- (NSString)debugDescription;
- (NSString)imageName;
- (NSTimer)longPressTimer;
- (UIFont)activeFont;
- (UIFont)alternateFullScreenFont;
- (UIFont)fullScreenFont;
- (UIFont)inlineFont;
- (UIViewPropertyAnimator)highlightAnimator;
- (UIVisualEffectView)backgroundEffectView;
- (double)_imageViewAlpha;
- (double)_preferredLayoutSize;
- (double)alternateImagePadding;
- (double)baselineOffsetFromBottom;
- (double)force;
- (double)forceThreshold;
- (double)fullscreenAlternateImagePadding;
- (double)horizontalTranslationOfLongPress;
- (double)maximumForceSinceTrackingBegan;
- (double)micaSnapshotAlpha;
- (double)trackingStartTime;
- (id)_preferredFont;
- (id)accessibilityLabel;
- (int64_t)tintEffectStyle;
- (uint64_t)_updateEdgeInsets;
- (void)_handleUserInteractionGestureRecognizer:(id)a3;
- (void)_resetTrackedState;
- (void)_updateBackgroundEffectViewIsHidden;
- (void)_updateImageIfNeeded;
- (void)_updateLayoutItem;
- (void)_updateTintColorIfNeeded;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)interruptActiveInteractions;
- (void)layoutAttributesDidChange;
- (void)layoutSubviews;
- (void)setActiveFont:(id)a3;
- (void)setActiveImageName:(id)a3;
- (void)setAlternateFullScreenFont:(id)a3;
- (void)setAlternateImageName:(id)a3;
- (void)setAlternateImagePadding:(double)a3;
- (void)setAppliesTransformToImageViewWhenHighlighted:(BOOL)a3;
- (void)setBackgroundEffectView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setClampsHitRectInsetsWhenContainedInScrollableView:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setContentIntersection:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablesHighlightWhenLongPressed:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setForce:(double)a3;
- (void)setForceThreshold:(double)a3;
- (void)setFullScreenFont:(id)a3;
- (void)setFullscreenAlternateImagePadding:(double)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setHighlightAnimator:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3;
- (void)setHorizontalTranslationOfLongPress:(double)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setImageName:(id)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setInlineFont:(id)a3;
- (void)setLongPressTimer:(id)a3;
- (void)setMaximumForceSinceTrackingBegan:(double)a3;
- (void)setMicaPackage:(id)a3;
- (void)setMicaSnapshotAlpha:(double)a3;
- (void)setMultipleTouchesEndsTracking:(BOOL)a3;
- (void)setPreviousHorizontalPositionOfLongPress:(id)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setSecondGeneration:(BOOL)a3;
- (void)setTintEffectStyle:(int64_t)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)setTrackingStartTime:(double)a3;
- (void)setTreatsForcePressAsLongPress:(BOOL)a3;
- (void)setUserInteractionGestureRecognizer:(id)a3;
- (void)setUsesBackgroundEffectViewForTextOnlyButtons:(BOOL)a3;
- (void)setWasForcePressTriggered:(BOOL)a3;
- (void)setWasLongPressed:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation AVButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFont, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_userInteractionGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_longPressTimer);
  objc_storeStrong((id *)&self->_previousHorizontalPositionOfLongPress, 0);
  objc_destroyWeak((id *)&self->_highlightAnimator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_micaPackage, 0);
  objc_storeStrong((id *)&self->_alternateFullScreenFont, 0);
  objc_storeStrong((id *)&self->_fullScreenFont, 0);
  objc_storeStrong((id *)&self->_inlineFont, 0);
  objc_storeStrong((id *)&self->_alternateImageName, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_activeImageName, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);

  objc_storeStrong((id *)&self->_accessibilityLabelOverride, 0);
}

- (void)setSecondGeneration:(BOOL)a3
{
  self->_secondGeneration = a3;
}

- (BOOL)isSecondGeneration
{
  return self->_secondGeneration;
}

- (void)setActiveFont:(id)a3
{
}

- (UIFont)activeFont
{
  return self->_activeFont;
}

- (void)setBackgroundEffectView:(id)a3
{
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setUserInteractionGestureRecognizer:(id)a3
{
}

- (AVUserInteractionObserverGestureRecognizer)userInteractionGestureRecognizer
{
  return self->_userInteractionGestureRecognizer;
}

- (void)setLongPressTimer:(id)a3
{
}

- (NSTimer)longPressTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_longPressTimer);

  return (NSTimer *)WeakRetained;
}

- (void)setPreviousHorizontalPositionOfLongPress:(id)a3
{
}

- (NSNumber)previousHorizontalPositionOfLongPress
{
  return self->_previousHorizontalPositionOfLongPress;
}

- (void)setHorizontalTranslationOfLongPress:(double)a3
{
  self->_horizontalTranslationOfLongPress = a3;
}

- (double)horizontalTranslationOfLongPress
{
  return self->_horizontalTranslationOfLongPress;
}

- (void)setWasForcePressTriggered:(BOOL)a3
{
  self->_wasForcePressTriggered = a3;
}

- (BOOL)wasForcePressTriggered
{
  return self->_wasForcePressTriggered;
}

- (void)setTrackingStartTime:(double)a3
{
  self->_trackingStartTime = a3;
}

- (double)trackingStartTime
{
  return self->_trackingStartTime;
}

- (void)setHighlightAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)highlightAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightAnimator);

  return (UIViewPropertyAnimator *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVButtonDelegate *)WeakRetained;
}

- (BOOL)isButtonOverVideo
{
  return self->_buttonIsOverVideo;
}

- (void)setClampsHitRectInsetsWhenContainedInScrollableView:(BOOL)a3
{
  self->_clampsHitRectInsetsWhenContainedInScrollableView = a3;
}

- (BOOL)clampsHitRectInsetsWhenContainedInScrollableView
{
  return self->_clampsHitRectInsetsWhenContainedInScrollableView;
}

- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (void)setDisablesHighlightWhenLongPressed:(BOOL)a3
{
  self->_disablesHighlightWhenLongPressed = a3;
}

- (BOOL)disablesHighlightWhenLongPressed
{
  return self->_disablesHighlightWhenLongPressed;
}

- (void)setMicaSnapshotAlpha:(double)a3
{
  self->_micaSnapshotAlpha = a3;
}

- (double)micaSnapshotAlpha
{
  return self->_micaSnapshotAlpha;
}

- (AVMicaPackage)micaPackage
{
  return self->_micaPackage;
}

- (void)setAlternateFullScreenFont:(id)a3
{
}

- (UIFont)alternateFullScreenFont
{
  return self->_alternateFullScreenFont;
}

- (void)setFullScreenFont:(id)a3
{
}

- (UIFont)fullScreenFont
{
  return self->_fullScreenFont;
}

- (void)setInlineFont:(id)a3
{
}

- (UIFont)inlineFont
{
  return self->_inlineFont;
}

- (void)setAppliesTransformToImageViewWhenHighlighted:(BOOL)a3
{
  self->_appliesTransformToImageViewWhenHighlighted = a3;
}

- (BOOL)appliesTransformToImageViewWhenHighlighted
{
  return self->_appliesTransformToImageViewWhenHighlighted;
}

- (void)setFullscreenAlternateImagePadding:(double)a3
{
  self->_fullscreenAlternateImagePadding = a3;
}

- (double)fullscreenAlternateImagePadding
{
  return self->_fullscreenAlternateImagePadding;
}

- (void)setAlternateImagePadding:(double)a3
{
  self->_alternateImagePadding = a3;
}

- (double)alternateImagePadding
{
  return self->_alternateImagePadding;
}

- (NSString)alternateImageName
{
  return self->_alternateImageName;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)activeImageName
{
  return self->_activeImageName;
}

- (BOOL)multipleTouchesEndsTracking
{
  return self->_multipleTouchesEndsTracking;
}

- (void)setMaximumForceSinceTrackingBegan:(double)a3
{
  self->_maximumForceSinceTrackingBegan = a3;
}

- (double)maximumForceSinceTrackingBegan
{
  return self->_maximumForceSinceTrackingBegan;
}

- (double)force
{
  return self->_force;
}

- (void)setForceThreshold:(double)a3
{
  self->_forceThreshold = a3;
}

- (double)forceThreshold
{
  return self->_forceThreshold;
}

- (BOOL)usesBackgroundEffectViewForTextOnlyButtons
{
  return self->_usesBackgroundEffectViewForTextOnlyButtons;
}

- (int64_t)tintEffectStyle
{
  return self->_tintEffectStyle;
}

- (void)setTreatsForcePressAsLongPress:(BOOL)a3
{
  self->_treatsForcePressAsLongPress = a3;
}

- (BOOL)treatsForcePressAsLongPress
{
  return self->_treatsForcePressAsLongPress;
}

- (BOOL)wasLongPressed
{
  return self->_wasLongPressed;
}

- (CGRect)contentIntersection
{
  double x = self->_contentIntersection.origin.x;
  double y = self->_contentIntersection.origin.y;
  double width = self->_contentIntersection.size.width;
  double height = self->_contentIntersection.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)AVButton;
  v3 = [(AVButton *)&v9 debugDescription];
  v4 = NSString;
  v5 = [(AVButton *)self accessibilityIdentifier];
  v6 = [v4 stringWithFormat:@" %@", v5];
  v7 = [v3 stringByAppendingString:v6];

  return (NSString *)v7;
}

- (void)_handleUserInteractionGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([(AVButton *)self multipleTouchesEndsTracking]
    && (unint64_t)[v4 numberOfTouches] >= 2)
  {
    [(AVButton *)self setEnabled:0];
    [(AVButton *)self setEnabled:1];
  }
}

- (void)interruptActiveInteractions
{
  id v2 = [(AVButton *)self contextMenuInteraction];
  [v2 dismissMenu];
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.CGFloat x = x;
    p_contentIntersection->origin.CGFloat y = y;
    p_contentIntersection->size.CGFloat width = width;
    p_contentIntersection->size.CGFloat height = height;
    [(AVButton *)self bounds];
    unint64_t v11 = (unint64_t)(COERCE__INT64(fabs(v9 * v10)) - 0x10000000000000) >> 53;
    BOOL v12 = COERCE__INT64(v9 * v10) < 0 || v11 > 0x3FE;
    BOOL v13 = v12 && (unint64_t)(COERCE__INT64(v9 * v10) - 1) > 0xFFFFFFFFFFFFELL;
    BOOL v14 = !v13 && p_contentIntersection->size.height * p_contentIntersection->size.width / (v9 * v10) > 0.8;
    if (self->_buttonIsOverVideo != v14)
    {
      self->_buttonIsOverVideo = v14;
      id v15 = [(AVButton *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v15 buttonIsOverVideoDidChange:self];
      }
    }
  }
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVButton *)self layoutAttributes];
  -[AVButton setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (void)layoutSubviews
{
  if ([(AVButton *)self hasFullScreenAppearance]) {
    double v3 = 12.0;
  }
  else {
    double v3 = 8.0;
  }
  id v4 = [(AVButton *)self backgroundEffectView];
  [(AVButton *)self bounds];
  CGRect v7 = CGRectInset(v6, 0.0, v3);
  objc_msgSend(v4, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);

  v5.receiver = self;
  v5.super_class = (Class)AVButton;
  [(AVButton *)&v5 layoutSubviews];
}

- (CGSize)intrinsicContentSize
{
  if ([(AVButton *)self isSecondGeneration])
  {
    [(AVButton *)&v10 intrinsicContentSize];
    goto LABEL_11;
  }
  uint64_t v5 = [(AVButton *)self titleForState:0];
  if (!v5)
  {
LABEL_8:
    double v3 = -[AVButton _preferredLayoutSize](self);
    goto LABEL_11;
  }
  CGRect v6 = (void *)v5;
  CGRect v7 = [(AVButton *)self imageForState:0];
  if (v7)
  {

    goto LABEL_8;
  }
  v8 = [(AVButton *)self micaPackage];

  if (v8) {
    goto LABEL_8;
  }
  [(AVButton *)&v9 intrinsicContentSize];
LABEL_11:
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (double)_preferredLayoutSize
{
  if (!a1) {
    return 0.0;
  }
  [a1 extrinsicContentSize];
  double v3 = v2;
  if (v4 > 0.0 && v2 <= 0.0)
  {
    if ([a1 hasFullScreenAppearance]) {
      [a1 fullscreenAlternateImagePadding];
    }
    else {
      [a1 alternateImagePadding];
    }
    double v6 = v5;
    if (![a1 hasAlternateAppearance]) {
      double v6 = 0.0;
    }
    CGRect v7 = [a1 imageForState:0];
    [v7 size];
    double v3 = v6 + v8;
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVButton *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)hitRect
{
  v26.receiver = self;
  v26.super_class = (Class)AVButton;
  [(AVButton *)&v26 hitRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(AVButton *)self hitRectInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(AVButton *)self effectiveUserInterfaceLayoutDirection];
  if (v19 == 1) {
    double v20 = v18;
  }
  else {
    double v20 = v14;
  }
  if (v19 == 1) {
    double v21 = v14;
  }
  else {
    double v21 = v18;
  }
  double v22 = v4 + v20;
  double v23 = v6 + v12;
  double v24 = v8 - (v20 + v21);
  double v25 = v10 - (v12 + v16);
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AVButton;
  -[AVButton setBounds:](&v19, sel_setBounds_);
  double v4 = [(AVButton *)self micaPackage];
  uint64_t v5 = [v4 rootLayer];
  if (v5)
  {
    double v6 = (void *)v5;
    UIRectGetCenter();
    double v8 = v7;
    double v10 = v9;
    double v11 = [(AVButton *)self micaPackage];
    double v12 = [v11 rootLayer];
    [v12 position];
    double v14 = v13;
    double v16 = v15;

    if (v8 != v14 || v10 != v16)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      double v17 = [(AVButton *)self micaPackage];
      double v18 = [v17 rootLayer];
      [(AVButton *)self bounds];
      UIRectGetCenter();
      objc_msgSend(v18, "setPosition:");

      [MEMORY[0x1E4F39CF8] commit];
    }
  }
  else
  {
  }
}

- (id)accessibilityLabel
{
  double v3 = self->_accessibilityLabelOverride;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVButton;
    double v3 = [(AVButton *)&v5 accessibilityLabel];
  }

  return v3;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(AVButton *)self titleForState:a4];
  v12.receiver = self;
  v12.super_class = (Class)AVButton;
  [(AVButton *)&v12 setTitle:v6 forState:a4];
  LOBYTE(a4) = [v7 isEqualToString:v6];

  if ((a4 & 1) == 0)
  {
    -[AVButton _updateBackgroundEffectViewIsHidden](self);
    -[AVButton _updateEdgeInsets]((uint64_t)self);
    -[AVButton _updateLayoutItem](self);
    [(AVButton *)self invalidateIntrinsicContentSize];
    double v8 = [(AVButton *)self superview];
    objc_msgSend(v8, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);
  }
  if (v6 && !v7)
  {
    double v9 = [(AVButton *)self layer];
    [v9 setCompositingFilter:0];

    int64_t v10 = [(AVButton *)self tintEffectStyle];
    double v11 = [(AVButton *)self titleLabel];
    if (v10) {
      +[AVBackdropView applySecondaryGlyphTintToView:v11];
    }
    else {
      +[AVBackdropView applyPrimaryGlyphTintToView:v11];
    }
  }
}

- (void)_updateBackgroundEffectViewIsHidden
{
  if (a1)
  {
    double v2 = [a1 titleForState:0];
    if (v2)
    {
      double v3 = [a1 titleForState:0];
      if ([v3 length])
      {
        double v4 = [a1 imageForState:0];
        if (v4)
        {
          uint64_t v5 = 1;
        }
        else
        {
          id v6 = [a1 micaPackage];
          if (v6) {
            uint64_t v5 = 1;
          }
          else {
            uint64_t v5 = [a1 usesBackgroundEffectViewForTextOnlyButtons] ^ 1;
          }
        }
      }
      else
      {
        uint64_t v5 = 1;
      }
    }
    else
    {
      uint64_t v5 = 1;
    }

    id v7 = [a1 backgroundEffectView];
    [v7 setHidden:v5];
  }
}

- (uint64_t)_updateEdgeInsets
{
  if (!result) {
    return result;
  }
  v1 = (void *)result;
  CGRect result = [(id)result isSecondGeneration];
  if (result) {
    return result;
  }
  int v2 = [v1 usesBackgroundEffectViewForTextOnlyButtons];
  int v3 = [v1 usesBackgroundEffectViewForTextOnlyButtons];
  double v4 = [v1 imageForState:0];
  if (v4)
  {
  }
  else
  {
    if (v3) {
      double v5 = 14.0;
    }
    else {
      double v5 = 16.0;
    }
    if (v2) {
      double v6 = 4.0;
    }
    else {
      double v6 = 16.0;
    }
    id v7 = [v1 micaPackage];

    if (!v7) {
      goto LABEL_14;
    }
  }
  double v5 = 0.0;
  double v6 = 0.0;
LABEL_14:

  return objc_msgSend(v1, "setContentEdgeInsets:", v5, v6, v5, v6);
}

- (void)_updateLayoutItem
{
  if (a1)
  {
    int v2 = [a1 layoutAttributes];
    [a1 intrinsicContentSize];
    objc_msgSend(v2, "setMinimumSize:");

    int v3 = [a1 layoutAttributes];
    if ([a1 isIncluded]) {
      uint64_t v4 = [a1 isRemoved] ^ 1;
    }
    else {
      uint64_t v4 = 0;
    }
    [v3 setIncluded:v4];

    id v5 = [a1 layoutAttributes];
    objc_msgSend(v5, "setCollapsed:", objc_msgSend(a1, "isCollapsed"));
  }
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  double v7 = -[AVButton _preferredLayoutSize](self);
  double v9 = v8;
  if (v6)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    int64_t v10 = [(AVButton *)self micaPackage];
    double v11 = [v10 rootLayer];
    [v11 setHidden:1];

    if (![(AVButton *)self isSecondGeneration])
    {
      objc_super v12 = [(AVButton *)self layer];
      double v13 = [v12 compositingFilter];

      if (!v13)
      {
        double v14 = [(AVButton *)self layer];
        [v14 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];

        double v15 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:-[AVButton _imageViewAlpha](self)];
        [(AVButton *)self setTintColor:v15];
      }
    }
    v26.receiver = self;
    v26.super_class = (Class)AVButton;
    [(AVButton *)&v26 setImage:v6 forState:a4];
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)AVButton;
    [(AVButton *)&v25 setImage:0 forState:a4];
    -[AVButton _updateTintColorIfNeeded](self);
  }
  BOOL v16 = [(AVButton *)self isSecondGeneration];
  if (v7 != -[AVButton _preferredLayoutSize](self) || v9 != v17 || v16)
  {
    [(AVButton *)self invalidateIntrinsicContentSize];
    double v18 = [(AVButton *)self superview];
    objc_msgSend(v18, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);
  }
  -[AVButton setContentEdgeInsets:](self, "setContentEdgeInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  -[AVButton _updateBackgroundEffectViewIsHidden](self);
  -[AVButton _updateEdgeInsets]((uint64_t)self);
  -[AVButton _updateLayoutItem](self);
  if (!v6)
  {
    objc_super v19 = [(AVButton *)self micaPackage];
    double v20 = [v19 rootLayer];
    int v21 = [v20 isHidden];

    if (v21)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      double v22 = [(AVButton *)self layer];
      [v22 setCompositingFilter:0];

      double v23 = [(AVButton *)self micaPackage];
      double v24 = [v23 rootLayer];
      [v24 setHidden:0];

      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

- (double)_imageViewAlpha
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = [a1 tintEffectStyle];
  int v3 = [a1 micaPackage];
  if (v3)
  {
    [a1 micaSnapshotAlpha];
    double v5 = v4;
  }
  else if (v2)
  {
    double v5 = 0.55;
  }
  else
  {
    double v5 = 0.75;
  }

  return v5;
}

- (void)_updateTintColorIfNeeded
{
  if (a1 && ([a1 isSecondGeneration] & 1) == 0)
  {
    uint64_t v2 = [a1 imageName];
    if (v2)
    {
    }
    else
    {
      int v3 = [a1 imageForState:0];

      if (!v3) {
        return;
      }
    }
    id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:-[AVButton _imageViewAlpha](a1)];
    [a1 setTintColor:v4];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVButton;
  [(AVButton *)&v5 cancelTrackingWithEvent:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVButton_cancelTrackingWithEvent___block_invoke;
  block[3] = &unk_1E5FC4698;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__36__AVButton_cancelTrackingWithEvent___block_invoke(uint64_t a1)
{
  return -[AVButton _resetTrackedState](*(void **)(a1 + 32));
}

- (void)_resetTrackedState
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = [result longPressTimer];
    [v2 invalidate];

    [v1 setHorizontalTranslationOfLongPress:0.0];
    [v1 setPreviousHorizontalPositionOfLongPress:0];
    [v1 setForce:0.0];
    [v1 setWasLongPressed:0];
    [v1 setMaximumForceSinceTrackingBegan:0.0];
    return (void *)[v1 setWasForcePressTriggered:0];
  }
  return result;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AVButton;
  [(AVButton *)&v6 endTrackingWithTouch:a3 withEvent:a4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVButton_endTrackingWithTouch_withEvent___block_invoke;
  block[3] = &unk_1E5FC4698;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__43__AVButton_endTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return -[AVButton _resetTrackedState](*(void **)(a1 + 32));
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AVButton;
  BOOL v7 = [(AVButton *)&v30 continueTrackingWithTouch:v6 withEvent:a4];
  if (v7)
  {
    [(AVButton *)self maximumForceSinceTrackingBegan];
    double v9 = v8;
    [(AVButton *)self forceThreshold];
    double v11 = v10;
    [(AVButton *)self maximumForceSinceTrackingBegan];
    double v13 = v12;
    [v6 force];
    if (v13 >= v14) {
      double v14 = v13;
    }
    [(AVButton *)self setMaximumForceSinceTrackingBegan:v14];
    double Current = CFAbsoluteTimeGetCurrent();
    [(AVButton *)self trackingStartTime];
    double v17 = v16;
    [(AVButton *)self maximumForceSinceTrackingBegan];
    double v19 = v18;
    [(AVButton *)self forceThreshold];
    if (v19 >= v20)
    {
      double v20 = Current - v17;
      if (Current - v17 > 0.12)
      {
        if ([(AVButton *)self treatsForcePressAsLongPress])
        {
          [(AVButton *)self setWasLongPressed:1];
        }
        else
        {
          [(AVButton *)self setWasLongPressed:0];
          int v21 = [(AVButton *)self longPressTimer];
          [v21 invalidate];

          [v6 force];
          -[AVButton setForce:](self, "setForce:");
          if (v9 < v11)
          {
            [(AVButton *)self setWasForcePressTriggered:1];
            [(AVButton *)self sendActionsForControlEvents:0x1000000];
          }
        }
      }
    }
    if ([(AVButton *)self wasLongPressed])
    {
      double v22 = [(AVButton *)self previousHorizontalPositionOfLongPress];

      if (v22)
      {
        double v23 = [(AVButton *)self previousHorizontalPositionOfLongPress];
        [v23 doubleValue];
        double v25 = v24;

        [v6 locationInView:self];
        [(AVButton *)self setHorizontalTranslationOfLongPress:v26 - v25];
      }
      v27 = NSNumber;
      [v6 locationInView:self];
      v28 = objc_msgSend(v27, "numberWithDouble:");
      [(AVButton *)self setPreviousHorizontalPositionOfLongPress:v28];
    }
  }

  return v7;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AVButton;
  BOOL v8 = [(AVButton *)&v19 beginTrackingWithTouch:v6 withEvent:v7];
  if (v8)
  {
    [(AVButton *)self setTrackingStartTime:CFAbsoluteTimeGetCurrent()];
    objc_initWeak(&location, self);
    double v9 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __45__AVButton_beginTrackingWithTouch_withEvent___block_invoke;
    double v16 = &unk_1E5FC4480;
    objc_copyWeak(&v17, &location);
    double v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:&v13 block:0.5];
    -[AVButton setLongPressTimer:](self, "setLongPressTimer:", v10, v13, v14, v15, v16);
    double v11 = [(AVButton *)self longPressTimer];
    [v11 setTolerance:0.05];

    [v6 force];
    -[AVButton setForce:](self, "setForce:");

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __45__AVButton_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setWasLongPressed:", objc_msgSend(v5, "isValid"));
    if ([WeakRetained isTracking]) {
      uint64_t v4 = [WeakRetained disablesHighlightWhenLongPressed] ^ 1;
    }
    else {
      uint64_t v4 = 0;
    }
    [WeakRetained setHighlighted:v4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3 = a3;
  if ([(AVButton *)self wasLongPressed]) {
    uint64_t v3 = v3 & ~[(AVButton *)self disablesHighlightWhenLongPressed];
  }
  v9.receiver = self;
  v9.super_class = (Class)AVButton;
  if (v3 != [(AVButton *)&v9 isHighlighted])
  {
    v8.receiver = self;
    v8.super_class = (Class)AVButton;
    [(AVButton *)&v8 setHighlighted:v3];
    if (!self->_disablesHighlightAnimation)
    {
      id v5 = [(AVButton *)self highlightAnimator];
      if ([v5 isRunning] && objc_msgSend(v5, "isInterruptible"))
      {
        [v5 stopAnimation:0];
        [v5 finishAnimationAtPosition:2];
      }
      if ([v5 isRunning])
      {
        id v6 = v5;
      }
      else
      {
        objc_initWeak(&location, self);
        id v7 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __38__AVButton__performHighlightAnimation__block_invoke;
        v10[3] = &unk_1E5FC44F8;
        objc_copyWeak(&v11, &location);
        id v6 = (void *)[v7 initWithDuration:3 curve:v10 animations:0.1];

        [v6 startAnimation];
        [(AVButton *)self setHighlightAnimator:v6];
        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __38__AVButton__performHighlightAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    memset(&v7, 0, sizeof(v7));
    if ([WeakRetained isHighlighted])
    {
      CGAffineTransformMakeScale(&v7, 0.75, 0.75);
    }
    else
    {
      long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v7.c = v3;
      *(_OWORD *)&v7.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    if ([v2 appliesTransformToImageViewWhenHighlighted])
    {
      uint64_t v4 = [v2 imageView];
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v5 = [v2 imageView];
      CGAffineTransform v6 = v7;
      [v5 setTransform:&v6];
    }
    else
    {
      CGAffineTransform v6 = v7;
      [v2 setTransform:&v6];
    }
  }
}

- (void)setTintEffectStyle:(int64_t)a3
{
  self->_tintEffectStyle = a3;
  -[AVButton _updateTintColorIfNeeded](self);
}

- (void)setEnabled:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVButton;
  -[AVButton setEnabled:](&v6, sel_setEnabled_);
  if ([(AVButton *)self isTracking] && !a3)
  {
    [(AVButton *)self setTracking:0];
    [(AVButton *)self setHighlighted:0];
    [(AVButton *)self sendActionsForControlEvents:256];
    [(AVButton *)self setForce:0.0];
    if ([(AVButton *)self wasLongPressed]) {
      [(AVButton *)self sendActionsForControlEvents:0x800000];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__AVButton_setEnabled___block_invoke;
    block[3] = &unk_1E5FC4698;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void *__23__AVButton_setEnabled___block_invoke(uint64_t a1)
{
  return -[AVButton _resetTrackedState](*(void **)(a1 + 32));
}

- (double)baselineOffsetFromBottom
{
  long long v3 = [(AVButton *)self imageForState:0];
  [v3 size];
  if (!v3) {
    goto LABEL_9;
  }
  double v5 = v4;
  float v6 = v4;
  *(float *)&double v4 = fabsf(v6);
  BOOL v7 = v6 <= 0.0 || *(float *)&v4 < 0.00000011921;
  if (v7
    || (-[AVButton titleForState:](self, "titleForState:", 0, 3.18618444e-58, v4),
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8)
    || ([(AVButton *)self intrinsicContentSize], v9 <= v5))
  {
LABEL_9:
    double v12 = NAN;
  }
  else
  {
    double v10 = v9;
    [v3 baselineOffsetFromBottom];
    double v12 = (v10 - v5) * 0.5 + v11;
  }

  return v12;
}

- (void)setUsesBackgroundEffectViewForTextOnlyButtons:(BOOL)a3
{
  if (self->_usesBackgroundEffectViewForTextOnlyButtons != a3)
  {
    BOOL v3 = a3;
    self->_usesBackgroundEffectViewForTextOnlyButtons = a3;
    double v5 = [(AVButton *)self backgroundEffectView];

    if (!v5 && v3)
    {
      float v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
      [(AVButton *)self setBackgroundEffectView:v6];

      BOOL v7 = [(AVButton *)self backgroundEffectView];
      [(AVButton *)self insertSubview:v7 atIndex:0];

      objc_super v8 = [(AVButton *)self backgroundEffectView];
      [v8 setUserInteractionEnabled:0];

      double v9 = [(AVButton *)self backgroundEffectView];
      double v10 = (void *)MEMORY[0x1E4FB1EF8];
      double v11 = [MEMORY[0x1E4FB1618] whiteColor];
      double v12 = [v10 effectCompositingColor:v11 withMode:24 alpha:0.1];
      [v9 setEffect:v12];

      uint64_t v13 = [(AVButton *)self backgroundEffectView];
      [v13 _setContinuousCornerRadius:6.0];
    }
    uint64_t v14 = [(AVButton *)self backgroundEffectView];
    [v14 setHidden:!v3];

    -[AVButton _updateEdgeInsets]((uint64_t)self);
  }
}

- (void)setMultipleTouchesEndsTracking:(BOOL)a3
{
  if (self->_multipleTouchesEndsTracking != a3)
  {
    self->_multipleTouchesEndsTracking = a3;
    if (a3)
    {
      double v4 = [[AVUserInteractionObserverGestureRecognizer alloc] initWithTarget:self action:sel__handleUserInteractionGestureRecognizer_];
      [(AVButton *)self setUserInteractionGestureRecognizer:v4];

      id v6 = [(AVButton *)self userInteractionGestureRecognizer];
      [(AVButton *)self addGestureRecognizer:v6];
    }
    else
    {
      double v5 = [(AVButton *)self userInteractionGestureRecognizer];
      [(AVButton *)self removeGestureRecognizer:v5];

      [(AVButton *)self setUserInteractionGestureRecognizer:0];
    }
  }
}

- (NSDirectionalEdgeInsets)hitRectInsets
{
  double top = self->_hitRectInsets.top;
  double leading = self->_hitRectInsets.leading;
  double bottom = self->_hitRectInsets.bottom;
  double trailing = self->_hitRectInsets.trailing;
  if ([(AVButton *)self clampsHitRectInsetsWhenContainedInScrollableView]&& [(UIView *)self avkit_isDescendantOfViewPassingTest:&__block_literal_global_23821])
  {
    double trailing = -32.0;
    double bottom = -32.0;
    double leading = -32.0;
    double top = -32.0;
  }
  double v7 = top;
  double v8 = leading;
  double v9 = bottom;
  double v10 = trailing;
  result.double trailing = v10;
  result.double bottom = v9;
  result.double leading = v8;
  result.double top = v7;
  return result;
}

BOOL __25__AVButton_hitRectInsets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  if ([v4 alwaysBounceVertical]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 alwaysBounceHorizontal];
  }
  [v4 contentSize];
  double v7 = v6;
  [v4 contentInset];
  double v9 = v8;
  [v4 contentInset];
  double v11 = v10;
  [v4 contentSize];
  double v13 = v12;
  [v4 contentInset];
  double v15 = v14;
  [v4 contentInset];
  if ((v5 & 1) != 0 || (double v17 = v16, [v4 bounds], v7 - v9 - v11 > CGRectGetWidth(v20)))
  {
    BOOL v18 = 1;
  }
  else
  {
    [v4 bounds];
    BOOL v18 = v13 - v15 - v17 > CGRectGetHeight(v21);
  }

  return v18;
}

- (void)setMicaPackage:(id)a3
{
  char v5 = (AVMicaPackage *)a3;
  micaPackage = self->_micaPackage;
  if (micaPackage != v5)
  {
    v29 = v5;
    double v7 = [(AVMicaPackage *)micaPackage rootLayer];
    [v7 removeFromSuperlayer];

    objc_storeStrong((id *)&self->_micaPackage, a3);
    double v8 = [(AVMicaPackage *)v29 rootLayer];
    uint64_t v9 = [(AVButton *)self imageForState:0];
    [v8 setHidden:v9 != 0];

    double v10 = [(AVMicaPackage *)v29 rootLayer];
    LOBYTE(v9) = [v10 isHidden];

    if ((v9 & 1) == 0)
    {
      double v11 = [(AVButton *)self layer];
      [v11 setCompositingFilter:0];
    }
    if (v29)
    {
      double v12 = [(AVButton *)self layer];
      double v13 = [(AVMicaPackage *)v29 rootLayer];
      [v12 addSublayer:v13];
    }
    double v14 = [(AVButton *)self micaPackage];
    uint64_t v15 = [v14 rootLayer];
    if (v15)
    {
      double v16 = (void *)v15;
      [(AVButton *)self bounds];
      UIRectGetCenter();
      double v18 = v17;
      double v20 = v19;
      CGRect v21 = [(AVButton *)self micaPackage];
      double v22 = [v21 rootLayer];
      [v22 position];
      double v24 = v23;
      double v26 = v25;

      if (v18 != v24 || v20 != v26)
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        v27 = [(AVButton *)self micaPackage];
        v28 = [v27 rootLayer];
        [(AVButton *)self bounds];
        UIRectGetCenter();
        objc_msgSend(v28, "setPosition:");

        [MEMORY[0x1E4F39CF8] commit];
      }
    }
    else
    {
    }
    -[AVButton _updateEdgeInsets]((uint64_t)self);
    -[AVButton _updateLayoutItem](self);
    char v5 = v29;
  }

  MEMORY[0x1F41817F8](micaPackage, v5);
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    if (![(AVButton *)self treatsForcePressAsLongPress])
    {
      [(AVButton *)self sendActionsForControlEvents:0x2000000];
    }
  }
}

- (void)setWasLongPressed:(BOOL)a3
{
  if (self->_wasLongPressed != a3)
  {
    self->_wasLongPressed = a3;
    if (a3) {
      uint64_t v3 = 0x400000;
    }
    else {
      uint64_t v3 = 0x800000;
    }
    [(AVButton *)self sendActionsForControlEvents:v3];
  }
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    if (![(AVButton *)self isSecondGeneration])
    {
      [(AVButton *)self invalidateIntrinsicContentSize];
      char v5 = [(AVButton *)self superview];
      objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);
    }
    -[AVButton _updateLayoutItem](self);
  }
}

- (void)setActiveImageName:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self->_activeImageName isEqualToString:v4])
  {
    char v5 = [(AVButton *)self activeFont];
    double v6 = -[AVButton _preferredFont](self);
    if ([v5 isEqual:v6])
    {

      goto LABEL_20;
    }
    if (v4)
    {

      goto LABEL_9;
    }
    activeImageName = self->_activeImageName;

    if (!activeImageName) {
      goto LABEL_20;
    }
  }
  else
  {
    if (v4)
    {
LABEL_9:
      if (!self->_activeImageName)
      {
        if ([(AVButton *)self tintEffectStyle]) {
          +[AVBackdropView applySecondaryGlyphTintToView:self];
        }
        else {
          +[AVBackdropView applyPrimaryGlyphTintToView:self];
        }
      }
      char v8 = 0;
      goto LABEL_16;
    }
    if (!self->_activeImageName) {
      goto LABEL_20;
    }
  }
  char v8 = 1;
LABEL_16:
  uint64_t v9 = (NSString *)[v4 copy];
  double v10 = self->_activeImageName;
  self->_activeImageName = v9;

  -[AVButton _preferredFont](self);
  double v11 = (UIFont *)objc_claimAutoreleasedReturnValue();
  activeFont = self->_activeFont;
  self->_activeFont = v11;

  if (v8 & 1) != 0 || ([v4 isEqualToString:@"AVMobileImageNameNoImage"])
  {
    [(AVButton *)self setImage:0 forState:0];
  }
  else
  {
    objc_initWeak(&location, self);
    double v13 = (void *)MEMORY[0x1E4FB1818];
    double v14 = [(AVButton *)self activeFont];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __31__AVButton_setActiveImageName___block_invoke;
    v15[3] = &unk_1E5FC4438;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    objc_msgSend(v13, "avkit_imageWithSymbolNamed:font:completion:", v16, v14, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
LABEL_20:
}

- (id)_preferredFont
{
  id v1 = a1;
  if (a1)
  {
    if ([a1 hasAlternateAppearance]) {
      [v1 alternateFullScreenFont];
    }
    else {
    id v2 = [v1 fullScreenFont];
    }
    if ([v1 hasFullScreenAppearance])
    {
      id v3 = v2;
    }
    else
    {
      id v3 = [v1 inlineFont];
    }
    id v1 = v3;
  }

  return v1;
}

void __31__AVButton_setActiveImageName___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = [WeakRetained activeImageName];
  LODWORD(a1) = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (a1)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 setImage:v13 forState:0];

    id v7 = objc_loadWeakRetained(v3);
    int v8 = [v7 isSecondGeneration];

    if (v8)
    {
      id v9 = objc_loadWeakRetained(v3);
      [v9 invalidateIntrinsicContentSize];

      id v10 = objc_loadWeakRetained(v3);
      double v11 = [v10 superview];
      id v12 = objc_loadWeakRetained(v3);
      objc_msgSend(v11, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v12);
    }
  }
}

- (void)setAlternateImageName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_alternateImageName, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    alternateImageName = self->_alternateImageName;
    self->_alternateImageName = v4;

    -[AVButton _updateImageIfNeeded](self);
  }
}

- (void)_updateImageIfNeeded
{
  if (a1)
  {
    if ([a1 hasAlternateAppearance]) {
      [a1 alternateImageName];
    }
    else {
    id v2 = [a1 imageName];
    }
    [a1 setActiveImageName:v2];
  }
}

- (void)setImageName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_imageName, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    imageName = self->_imageName;
    self->_imageName = v4;

    -[AVButton _updateImageIfNeeded](self);
  }
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  if (self->_hasAlternateAppearance != a3)
  {
    self->_hasAlternateAppearance = a3;
    -[AVButton _updateImageIfNeeded](self);
  }
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  if (self->_hasFullScreenAppearance != a3)
  {
    self->_hasFullScreenAppearance = a3;
    -[AVButton _updateImageIfNeeded](self);
    -[AVButton _updateEdgeInsets]((uint64_t)self);
  }
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVButton;
  -[AVButton willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3) {
    -[AVButton _updateImageIfNeeded](self);
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    -[AVButton _updateLayoutItem](self);
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    -[AVButton _updateLayoutItem](self);
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    -[AVButton _updateLayoutItem](self);
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVButton *)self isCollapsed] || ![(AVButton *)self isIncluded]) {
    return 1;
  }

  return [(AVButton *)self isRemoved];
}

+ (AVButton)buttonWithAccessibilityIdentifier:(id)a3 accessibilityLabel:(id)a4 isSecondGeneration:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() buttonWithType:0];
  [(id)v9 setSecondGeneration:v5];
  if (v5) {
    [(id)v9 setPointerInteractionEnabled:1];
  }
  [(id)v9 _setVisualEffectViewEnabled:0 backgroundColor:0];
  LODWORD(v10) = 1148846080;
  [(id)v9 setContentHuggingPriority:0 forAxis:v10];
  LODWORD(v11) = 1148846080;
  [(id)v9 setContentHuggingPriority:1 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(id)v9 setContentCompressionResistancePriority:0 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [(id)v9 setContentCompressionResistancePriority:1 forAxis:v13];
  [(id)v9 setIncluded:1];
  [(id)v9 setAccessibilityIdentifier:v8];

  objc_msgSend((id)v9, "setHitRectInsets:", -16.0, -16.0, -16.0, -16.0);
  [(id)v9 setForceThreshold:2.0];
  [(id)v9 setTintEffectStyle:1];
  [(id)v9 setAdjustsImageWhenHighlighted:0];
  [(id)v9 setMicaSnapshotAlpha:1.0];
  double v14 = *MEMORY[0x1E4FB09D0];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2998], *MEMORY[0x1E4FB09D0]);
  [(id)v9 setFullScreenFont:v15];

  id v16 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2990], v14);
  [(id)v9 setAlternateFullScreenFont:v16];

  id v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB28D0], v14);
  [(id)v9 setInlineFont:v17];

  double v18 = *(void **)(v9 + 744);
  *(void *)(v9 + 744) = v7;
  id v19 = v7;

  double v20 = objc_alloc_init(AVLayoutItemAttributes);
  CGRect v21 = *(void **)(v9 + 768);
  *(void *)(v9 + 768) = v20;

  double v22 = *(void **)(v9 + 768);
  [(id)v9 intrinsicContentSize];
  objc_msgSend(v22, "setMinimumSize:");
  objc_msgSend(*(id *)(v9 + 768), "setCollapsed:", objc_msgSend((id)v9, "isCollapsed"));
  objc_msgSend(*(id *)(v9 + 768), "setIncluded:", objc_msgSend((id)v9, "isIncluded"));
  [*(id *)(v9 + 768) setHasFlexibleContentSize:0];
  double v23 = *(void **)(v9 + 768);
  double v24 = [(id)v9 accessibilityIdentifier];
  [v23 setAccessibilityIdentifier:v24];

  return (AVButton *)(id)v9;
}

+ (AVButton)buttonWithAccessibilityIdentifier:(id)a3 isSecondGeneration:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() buttonWithAccessibilityIdentifier:v5 accessibilityLabel:0 isSecondGeneration:v4];

  return (AVButton *)v6;
}

+ (id)customHighlightedAnimationButtonWithAccessibilityIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() buttonWithAccessibilityIdentifier:v3 isSecondGeneration:1];

  v4[752] = 1;

  return v4;
}

@end