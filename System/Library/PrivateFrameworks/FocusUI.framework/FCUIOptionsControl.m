@interface FCUIOptionsControl
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isParentControlHighlighted;
- (BOOL)isParentControlSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FCUIOptionsControl)initWithReferencePointSize:(double)a3 maximumPointSize:(double)a4;
- (NSArray)requiredVisualStyleCategories;
- (NSString)preferredContentSizeCategory;
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

@implementation FCUIOptionsControl

- (FCUIOptionsControl)initWithReferencePointSize:(double)a3 maximumPointSize:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)FCUIOptionsControl;
  v6 = [(FCUIOptionsControl *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_referencePointSize = a3;
    v6->_maxPointSize = a4;
    v8 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1)
    {
      -[FCUIOptionsControl setHitTestInsets:](v7, "setHitTestInsets:", -8.0, -8.0, -8.0, -8.0);
      v10 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v7];
      [(FCUIOptionsControl *)v7 addInteraction:v10];
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

    [(FCUIOptionsControl *)self setNeedsLayout];
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
    p_glyphVisualStylingProvider = (MTVisualStylingProvider **)[(FCUIOptionsControl *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_glyphVisualStylingProvider, v5);
}

- (void)setParentControlHighlighted:(BOOL)a3
{
  if (self->_parentControlHighlighted != a3)
  {
    self->_parentControlHighlighted = a3;
    [(FCUIOptionsControl *)self setNeedsLayout];
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
      v5 = [MEMORY[0x263F825C8] systemBlueColor];
      [(FCUIOptionsControl *)self setTintColor:v5];
    }
    [(FCUIOptionsControl *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(FCUIOptionsControl *)self _configureGlyphViewIfNecessary];
  [(FCUIOptionsControl *)self _updateTextAttributesIfNecessary];
  [(FCUIOptionsControl *)self _scaledValueForValue:self->_referencePointSize];
  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)FCUIOptionsControl;
  [(FCUIOptionsControl *)&v12 layoutSubviews];
  [(FCUIOptionsControl *)self _configureBackgroundViewIfNecessary];
  [(FCUIOptionsControl *)self _configureGlyphViewIfNecessary];
  [(FCUIOptionsControl *)self _updateTextAttributesIfNecessary];
  [(FCUIOptionsControl *)self bounds];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__FCUIOptionsControl_layoutSubviews__block_invoke;
  v11[3] = &unk_264542E38;
  v11[4] = self;
  v11[5] = v3;
  v11[6] = v4;
  v11[7] = v5;
  v11[8] = v6;
  [MEMORY[0x263F82E00] performWithoutAnimation:v11];
  backgroundView = self->_backgroundView;
  char v8 = [(FCUIOptionsControl *)self isHighlighted];
  double v9 = 1.0;
  if ((v8 & 1) == 0)
  {
    int v10 = [(FCUIOptionsControl *)self isSelected];
    double v9 = 0.0;
    if (v10) {
      double v9 = 1.0;
    }
  }
  [(UIView *)backgroundView setAlpha:v9];
  [(FCUIOptionsControl *)self _updateVisualStylingOfView:self->_glyphView style:[(FCUIOptionsControl *)self _glyphViewVisualStyleForCurrentState] visualStylingProvider:self->_glyphVisualStylingProvider outgoingProvider:0];
}

uint64_t __36__FCUIOptionsControl_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 456) _setCornerRadius:CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5];
  v2 = *(void **)(*(void *)(a1 + 32) + 464);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(FCUIOptionsControl *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)FCUIOptionsControl;
  [(FCUIOptionsControl *)&v6 setHighlighted:v3];
  if (v5 != [(FCUIOptionsControl *)self isHighlighted])
  {
    [(FCUIOptionsControl *)self setNeedsLayout];
    [(FCUIOptionsControl *)self layoutIfNeeded];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(FCUIOptionsControl *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)FCUIOptionsControl;
  [(FCUIOptionsControl *)&v6 setSelected:v3];
  if (v5 != [(FCUIOptionsControl *)self isSelected])
  {
    [(FCUIOptionsControl *)self setNeedsLayout];
    [(FCUIOptionsControl *)self layoutIfNeeded];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(FCUIOptionsControl *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(FCUIOptionsControl *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(FCUIOptionsControl *)self _setNeedsTextAttributesUpdate];
  }
  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26D1C0308;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  v13 = (MTVisualStylingProvider *)a3;
  objc_super v6 = [(FCUIOptionsControl *)self requiredVisualStyleCategories];
  v7 = [NSNumber numberWithInteger:a4];
  if ([(MTVisualStylingProvider *)v6 containsObject:v7])
  {
    glyphVisualStylingProvider = self->_glyphVisualStylingProvider;

    double v9 = v13;
    if (glyphVisualStylingProvider == v13) {
      goto LABEL_6;
    }
    int v10 = self->_glyphVisualStylingProvider;
    v11 = v13;
    objc_super v12 = self->_glyphVisualStylingProvider;
    self->_glyphVisualStylingProvider = v11;
    objc_super v6 = v10;

    [(FCUIOptionsControl *)self _visualStylingProviderDidChange:self->_glyphVisualStylingProvider forCategory:a4 outgoingProvider:v6];
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
    int v5 = 0;
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x263F82A80];
    objc_msgSend(a5, "rect", a3, a4);
    UIRectInset();
    int v5 = objc_msgSend(v6, "regionWithRect:identifier:", 0);
  }
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x263F82AD0]);
  objc_super v6 = (void *)MEMORY[0x263F824C0];
  [(UIView *)self->_backgroundView bounds];
  v7 = objc_msgSend(v6, "bezierPathWithOvalInRect:");
  [v5 setVisiblePath:v7];

  char v8 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self parameters:v5];
  double v9 = (void *)MEMORY[0x263F82A90];
  int v10 = [MEMORY[0x263F82A78] effectWithPreview:v8];
  v11 = [v9 styleWithEffect:v10 shape:0];

  return v11;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__FCUIOptionsControl_pointerInteraction_willEnterRegion_animator___block_invoke;
  v5[3] = &unk_264542B68;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

uint64_t __66__FCUIOptionsControl_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:1];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__FCUIOptionsControl_pointerInteraction_willExitRegion_animator___block_invoke;
  v5[3] = &unk_264542B68;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

uint64_t __65__FCUIOptionsControl_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

- (double)_scaledValueForValue:(double)a3
{
  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    objc_super v6 = (void *)MEMORY[0x263F81708];
    uint64_t v7 = *MEMORY[0x263F83570];
    char v8 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:self->_preferredContentSizeCategory];
    double v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];
    int v10 = self->_referenceFont;
    self->_referenceFont = v9;

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

  [(FCUIOptionsControl *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(FCUIOptionsControl *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  glyphView = self->_glyphView;
  uint64_t v7 = (void *)MEMORY[0x263F82818];
  [(FCUIOptionsControl *)self _scaledValueForValue:self->_referencePointSize];
  if (maxPointSize > self->_maxPointSize) {
    double maxPointSize = self->_maxPointSize;
  }
  id v9 = [v7 configurationWithPointSize:maxPointSize];
  [(UIImageView *)glyphView setPreferredSymbolConfiguration:v9];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(FCUIOptionsControl *)self _needsTextAttributesUpdate])
  {
    [(FCUIOptionsControl *)self _updateTextAttributes];
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
      uint64_t v7 = @"checkmark";
    }
    else {
      uint64_t v7 = 0;
    }
    id v5 = v7;
  }
  else
  {
    id v4 = @"ellipsis";
    if (a3) {
      id v4 = 0;
    }
    if (a3 == 1) {
      id v5 = @"chevron.forward";
    }
    else {
      id v5 = v4;
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
    [(FCUIOptionsControl *)self _updateVisualStylingOfView:glyphView style:[(FCUIOptionsControl *)self _glyphViewVisualStyleForCurrentState] visualStylingProvider:v10 outgoingProvider:v9];
  }
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    uint64_t v3 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)self->_backgroundView setAlpha:0.0];
    uint64_t v5 = self->_backgroundView;
    objc_super v6 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.25];
    [(UIView *)v5 setBackgroundColor:v6];

    [(FCUIOptionsControl *)self insertSubview:self->_backgroundView atIndex:0];
    uint64_t v7 = self->_backgroundView;
    [(UIView *)v7 setAlpha:0.0];
  }
}

- (void)_configureGlyphViewIfNecessary
{
  if (!self->_glyphView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82828]);
    id v4 = (void *)MEMORY[0x263F827E8];
    uint64_t v5 = [(FCUIOptionsControl *)self _glyphImageNameForCurrentStateWithControlType:self->_controlType];
    objc_super v6 = [(FCUIOptionsControl *)self traitCollection];
    uint64_t v7 = [v4 systemImageNamed:v5 compatibleWithTraitCollection:v6];
    char v8 = (UIImageView *)[v3 initWithImage:v7];
    glyphView = self->_glyphView;
    self->_glyphView = v8;

    [(UIImageView *)self->_glyphView setContentMode:4];
    id v10 = self->_glyphView;
    v11 = [(FCUIOptionsControl *)self tintColor];
    [(UIImageView *)v10 setTintColor:v11];

    [(FCUIOptionsControl *)self addSubview:self->_glyphView];
    objc_super v12 = self->_glyphView;
    int64_t v13 = [(FCUIOptionsControl *)self _glyphViewVisualStyleForCurrentState];
    glyphVisualStylingProvider = self->_glyphVisualStylingProvider;
    [(FCUIOptionsControl *)self _updateVisualStylingOfView:v12 style:v13 visualStylingProvider:glyphVisualStylingProvider outgoingProvider:0];
  }
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCUIOptionsControl;
  id v4 = a3;
  [(FCUIOptionsControl *)&v5 setTintColor:v4];
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