@interface RPCCUIOptionsControl
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isParentControlHighlighted;
- (BOOL)isParentControlSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)preferredContentSizeCategory;
- (RPCCUIOptionsControl)initWithReferencePointSize:(double)a3 maximumPointSize:(double)a4;
- (double)_scaledValueForValue:(double)a3;
- (id)_glyphImageNameForCurrentStateWithControlType:(int64_t)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_glyphViewVisualStyleForCurrentState;
- (int64_t)controlType;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureGlyphViewIfNecessary;
- (void)_setNeedsTextAttributesUpdate;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesIfNecessary;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setControlType:(int64_t)a3;
- (void)setGlyphVisualStylingProvider:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setParentControlHighlighted:(BOOL)a3;
- (void)setParentControlSelected:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation RPCCUIOptionsControl

- (RPCCUIOptionsControl)initWithReferencePointSize:(double)a3 maximumPointSize:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)RPCCUIOptionsControl;
  v6 = [(RPCCUIOptionsControl *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_referencePointSize = a3;
    v6->_maxPointSize = a4;
    v8 = +[UIDevice currentDevice];
    v9 = (char *)[v8 userInterfaceIdiom];

    if (v9 == (unsigned char *)&dword_0 + 1)
    {
      -[RPCCUIOptionsControl setHitTestInsets:](v7, "setHitTestInsets:", -8.0, -8.0, -8.0, -8.0);
      id v10 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v7];
      [(RPCCUIOptionsControl *)v7 addInteraction:v10];
    }
  }
  return v7;
}

- (void)setControlType:(int64_t)a3
{
  if (self->_controlType != a3)
  {
    self->_controlType = a3;
    [(UIImageView *)self->_glyphView removeFromSuperview];
    glyphView = self->_glyphView;
    self->_glyphView = 0;

    [(RPCCUIOptionsControl *)self setNeedsLayout];
  }
}

- (void)setGlyphVisualStylingProvider:(id)a3
{
  v5 = (MTVisualStylingProvider *)a3;
  p_glyphVisualStylingProvider = &self->_glyphVisualStylingProvider;
  if (self->_glyphVisualStylingProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_glyphVisualStylingProvider, a3);
    p_glyphVisualStylingProvider = (MTVisualStylingProvider **)[(RPCCUIOptionsControl *)self setNeedsLayout];
    v5 = v7;
  }

  _objc_release_x1(p_glyphVisualStylingProvider, v5);
}

- (void)setParentControlHighlighted:(BOOL)a3
{
  if (self->_parentControlHighlighted != a3)
  {
    self->_parentControlHighlighted = a3;
    [(RPCCUIOptionsControl *)self setNeedsLayout];
  }
}

- (void)setParentControlSelected:(BOOL)a3
{
  if (self->_parentControlSelected != a3)
  {
    self->_parentControlSelected = a3;
    [(UIImageView *)self->_glyphView removeFromSuperview];
    glyphView = self->_glyphView;
    self->_glyphView = 0;

    if (self->_controlType == 2)
    {
      v5 = +[UIColor systemBlueColor];
      [(RPCCUIOptionsControl *)self setTintColor:v5];
    }
    [(RPCCUIOptionsControl *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(RPCCUIOptionsControl *)self _configureGlyphViewIfNecessary];
  [(RPCCUIOptionsControl *)self _updateTextAttributesIfNecessary];
  [(RPCCUIOptionsControl *)self _scaledValueForValue:self->_referencePointSize];

  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)RPCCUIOptionsControl;
  [(RPCCUIOptionsControl *)&v12 layoutSubviews];
  [(RPCCUIOptionsControl *)self _configureBackgroundViewIfNecessary];
  [(RPCCUIOptionsControl *)self _configureGlyphViewIfNecessary];
  [(RPCCUIOptionsControl *)self _updateTextAttributesIfNecessary];
  [(RPCCUIOptionsControl *)self bounds];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1896C;
  v11[3] = &unk_69358;
  v11[4] = self;
  v11[5] = v3;
  v11[6] = v4;
  v11[7] = v5;
  v11[8] = v6;
  +[UIView performWithoutAnimation:v11];
  backgroundView = self->_backgroundView;
  unsigned __int8 v8 = [(RPCCUIOptionsControl *)self isHighlighted];
  double v9 = 1.0;
  if ((v8 & 1) == 0)
  {
    unsigned int v10 = [(RPCCUIOptionsControl *)self isSelected];
    double v9 = 0.0;
    if (v10) {
      double v9 = 1.0;
    }
  }
  [(UIView *)backgroundView setAlpha:v9];
  [(RPCCUIOptionsControl *)self _updateVisualStylingOfView:self->_glyphView style:[(RPCCUIOptionsControl *)self _glyphViewVisualStyleForCurrentState] visualStylingProvider:self->_glyphVisualStylingProvider outgoingProvider:0];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != (char *)&dword_0 + 1
    || [v4 numberOfTapsRequired] != (char *)&dword_0 + 1;

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(RPCCUIOptionsControl *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)RPCCUIOptionsControl;
  [(RPCCUIOptionsControl *)&v6 setHighlighted:v3];
  if (v5 != [(RPCCUIOptionsControl *)self isHighlighted])
  {
    [(RPCCUIOptionsControl *)self setNeedsLayout];
    [(RPCCUIOptionsControl *)self layoutIfNeeded];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(RPCCUIOptionsControl *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)RPCCUIOptionsControl;
  [(RPCCUIOptionsControl *)&v6 setSelected:v3];
  if (v5 != [(RPCCUIOptionsControl *)self isSelected])
  {
    [(RPCCUIOptionsControl *)self setNeedsLayout];
    [(RPCCUIOptionsControl *)self layoutIfNeeded];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(RPCCUIOptionsControl *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCUIOptionsControl *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(RPCCUIOptionsControl *)self _setNeedsTextAttributesUpdate];
  }
  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&off_6B378;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  v13 = (MTVisualStylingProvider *)a3;
  objc_super v6 = [(RPCCUIOptionsControl *)self requiredVisualStyleCategories];
  v7 = +[NSNumber numberWithInteger:a4];
  if ([(MTVisualStylingProvider *)v6 containsObject:v7])
  {
    glyphVisualStylingProvider = self->_glyphVisualStylingProvider;

    double v9 = v13;
    if (glyphVisualStylingProvider == v13) {
      goto LABEL_6;
    }
    unsigned int v10 = self->_glyphVisualStylingProvider;
    v11 = v13;
    objc_super v12 = self->_glyphVisualStylingProvider;
    self->_glyphVisualStylingProvider = v11;
    objc_super v6 = v10;

    [(RPCCUIOptionsControl *)self _visualStylingProviderDidChange:self->_glyphVisualStylingProvider forCategory:a4 outgoingProvider:v6];
  }
  else
  {
  }
  double v9 = v13;
LABEL_6:
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  if (self->_controlType)
  {
    unsigned int v5 = 0;
  }
  else
  {
    objc_msgSend(a5, "rect", a3, a4);
    UIRectInset();
    unsigned int v5 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0);
  }

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init((Class)UIPreviewParameters);
  [(UIView *)self->_backgroundView bounds];
  objc_super v6 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  [v5 setVisiblePath:v6];

  id v7 = [objc_alloc((Class)UITargetedPreview) initWithView:self parameters:v5];
  unsigned __int8 v8 = +[UIPointerLiftEffect effectWithPreview:v7];
  double v9 = +[UIPointerStyle styleWithEffect:v8 shape:0];

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18E9C;
  v5[3] = &unk_68F10;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18F18;
  v5[3] = &unk_68F10;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

- (double)_scaledValueForValue:(double)a3
{
  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    objc_super v6 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:self->_preferredContentSizeCategory];
    id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v6];
    unsigned __int8 v8 = self->_referenceFont;
    self->_referenceFont = v7;

    referenceFont = self->_referenceFont;
  }

  [(UIFont *)referenceFont _scaledValueForValue:a3];
  return result;
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_referenceFont == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  referenceFont = self->_referenceFont;
  self->_referenceFont = 0;

  [(RPCCUIOptionsControl *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(RPCCUIOptionsControl *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  glyphView = self->_glyphView;
  [(RPCCUIOptionsControl *)self _scaledValueForValue:self->_referencePointSize];
  if (maxPointSize > self->_maxPointSize) {
    double maxPointSize = self->_maxPointSize;
  }
  id v8 = +[UIImageSymbolConfiguration configurationWithPointSize:maxPointSize];
  [(UIImageView *)glyphView setPreferredSymbolConfiguration:v8];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(RPCCUIOptionsControl *)self _needsTextAttributesUpdate])
  {
    [(RPCCUIOptionsControl *)self _updateTextAttributes];
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (id)_glyphImageNameForCurrentStateWithControlType:(int64_t)a3
{
  if (a3 == 2)
  {
    if (self->_parentControlSelected) {
      id v7 = @"checkmark";
    }
    else {
      id v7 = 0;
    }
    id v5 = v7;
  }
  else
  {
    CFStringRef v4 = @"ellipsis";
    if (a3) {
      CFStringRef v4 = 0;
    }
    if (a3 == 1) {
      id v5 = @"chevron.forward";
    }
    else {
      id v5 = (__CFString *)v4;
    }
  }
  return v5;
}

- (int64_t)_glyphViewVisualStyleForCurrentState
{
  return 2 * self->_parentControlHighlighted;
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  if (a4 == 1)
  {
    glyphView = self->_glyphView;
    id v9 = a5;
    id v10 = a3;
    [(RPCCUIOptionsControl *)self _updateVisualStylingOfView:glyphView style:[(RPCCUIOptionsControl *)self _glyphViewVisualStyleForCurrentState] visualStylingProvider:v10 outgoingProvider:v9];
  }
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    uint64_t v3 = (UIView *)objc_alloc_init((Class)UIView);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)self->_backgroundView setAlpha:0.0];
    uint64_t v5 = self->_backgroundView;
    objc_super v6 = +[UIColor colorWithWhite:1.0 alpha:0.25];
    [(UIView *)v5 setBackgroundColor:v6];

    [(RPCCUIOptionsControl *)self insertSubview:self->_backgroundView atIndex:0];
    id v7 = self->_backgroundView;
    [(UIView *)v7 setAlpha:0.0];
  }
}

- (void)_configureGlyphViewIfNecessary
{
  if (!self->_glyphView)
  {
    id v3 = objc_alloc((Class)UIImageView);
    CFStringRef v4 = [(RPCCUIOptionsControl *)self _glyphImageNameForCurrentStateWithControlType:self->_controlType];
    uint64_t v5 = [(RPCCUIOptionsControl *)self traitCollection];
    objc_super v6 = +[UIImage systemImageNamed:v4 compatibleWithTraitCollection:v5];
    id v7 = (UIImageView *)[v3 initWithImage:v6];
    glyphView = self->_glyphView;
    self->_glyphView = v7;

    [(UIImageView *)self->_glyphView setContentMode:4];
    id v9 = self->_glyphView;
    id v10 = [(RPCCUIOptionsControl *)self tintColor];
    [(UIImageView *)v9 setTintColor:v10];

    [(RPCCUIOptionsControl *)self addSubview:self->_glyphView];
    v11 = self->_glyphView;
    int64_t v12 = [(RPCCUIOptionsControl *)self _glyphViewVisualStyleForCurrentState];
    glyphVisualStylingProvider = self->_glyphVisualStylingProvider;
    [(RPCCUIOptionsControl *)self _updateVisualStylingOfView:v11 style:v12 visualStylingProvider:glyphVisualStylingProvider outgoingProvider:0];
  }
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPCCUIOptionsControl;
  id v4 = a3;
  [(RPCCUIOptionsControl *)&v5 setTintColor:v4];
  -[UIImageView setTintColor:](self->_glyphView, "setTintColor:", v4, v5.receiver, v5.super_class);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (int64_t)controlType
{
  return self->_controlType;
}

- (BOOL)isParentControlHighlighted
{
  return self->_parentControlHighlighted;
}

- (BOOL)isParentControlSelected
{
  return self->_parentControlSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);
  objc_storeStrong((id *)&self->_glyphVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end