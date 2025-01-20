@interface HUQuickControlStepperSegmentView
- (BOOL)isSegmentViewHighlighted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (HUQuickControlStepperSegmentView)initWithStyle:(unint64_t)a3 orientation:(unint64_t)a4 controlSize:(unint64_t)a5;
- (NSString)title;
- (UILabel)titleLabel;
- (UIView)highlightedOverlayView;
- (UIVisualEffectView)titleLabelEffectView;
- (double)cornerRadius;
- (unint64_t)controlSize;
- (unint64_t)orientation;
- (unint64_t)reachabilityState;
- (unint64_t)segmentLocation;
- (unint64_t)style;
- (void)_contentSizeCategoryDidChange;
- (void)_createTitleLabelIfNecessary;
- (void)_updateTitleLabel;
- (void)_updateUIHighlightedOverlayView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setControlSize:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighlightedOverlayView:(id)a3;
- (void)setIsSegmentViewHighlighted:(BOOL)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSegmentLocation:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelEffectView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUQuickControlStepperSegmentView

- (HUQuickControlStepperSegmentView)initWithStyle:(unint64_t)a3 orientation:(unint64_t)a4 controlSize:(unint64_t)a5
{
  v22.receiver = self;
  v22.super_class = (Class)HUQuickControlStepperSegmentView;
  v8 = [(HUQuickControlStepperSegmentView *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v8->_orientation = a4;
    v8->_controlSize = a5;
    [(HUQuickControlStepperSegmentView *)v8 bounds];
    double v11 = v10;
    if (a4)
    {
      double v11 = v10 * 1.25;
      [(HUQuickControlStepperSegmentView *)v9 bounds];
      double v13 = v12;
    }
    else
    {
      [(HUQuickControlStepperSegmentView *)v9 bounds];
      double v13 = v14 * 1.25;
    }
    [(HUQuickControlStepperSegmentView *)v9 bounds];
    double v16 = v15;
    [(HUQuickControlStepperSegmentView *)v9 bounds];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v11, v13);
    highlightedOverlayView = v9->_highlightedOverlayView;
    v9->_highlightedOverlayView = (UIView *)v18;

    [(HUQuickControlStepperSegmentView *)v9 insertSubview:v9->_highlightedOverlayView atIndex:0];
    [(UIView *)v9->_highlightedOverlayView setUserInteractionEnabled:0];
    v20 = [(HUQuickControlStepperSegmentView *)v9 tintColor];
    [(UIView *)v9->_highlightedOverlayView setBackgroundColor:v20];
  }
  return v9;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
  [(HUQuickControlStepperSegmentView *)self _updateTitleLabel];
}

- (void)setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
  [(HUQuickControlStepperSegmentView *)self _updateTitleLabel];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  uint64_t v7 = [v4 length];
  if (v7)
  {
    [(HUQuickControlStepperSegmentView *)self _createTitleLabelIfNecessary];
    [(HUQuickControlStepperSegmentView *)self _updateTitleLabel];
  }
}

- (void)setIsSegmentViewHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HUQuickControlStepperSegmentView_setIsSegmentViewHighlighted___block_invoke;
  v7[3] = &unk_1E6386018;
  v7[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
  self->_isSegmentViewHighlighted = v3;
  if (v3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  v6 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];
  [v6 setAlpha:v5];

  [(HUQuickControlStepperSegmentView *)self _updateTitleLabel];
}

uint64_t __64__HUQuickControlStepperSegmentView_setIsSegmentViewHighlighted___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) reachabilityState];
  if (result == 2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _updateUIHighlightedOverlayView];
  }
  return result;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(HUQuickControlStepperSegmentView *)self _updateUIHighlightedOverlayView];
}

- (void)setSegmentLocation:(unint64_t)a3
{
  self->_segmentLocation = a3;
  [(HUQuickControlStepperSegmentView *)self _updateUIHighlightedOverlayView];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlStepperSegmentView;
  id v4 = a3;
  [(HUQuickControlStepperSegmentView *)&v8 traitCollectionDidChange:v4];
  double v5 = [(HUQuickControlStepperSegmentView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  uint64_t v7 = [v4 verticalSizeClass];

  if (v6 != v7) {
    [(HUQuickControlStepperSegmentView *)self _updateTitleLabel];
  }
}

- (void)_createTitleLabelIfNecessary
{
  BOOL v3 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUQuickControlStepperSegmentView *)self setTitleLabel:v4];

    double v5 = [(HUQuickControlStepperSegmentView *)self titleLabel];
    [v5 setUserInteractionEnabled:0];

    uint64_t v6 = [(HUQuickControlStepperSegmentView *)self titleLabel];
    [v6 setNumberOfLines:0];

    uint64_t v7 = [(HUQuickControlStepperSegmentView *)self titleLabel];
    [v7 setTextAlignment:1];

    objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    [(HUQuickControlStepperSegmentView *)self setTitleLabelEffectView:v9];

    double v10 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
    [v10 setUserInteractionEnabled:0];

    double v11 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
    double v12 = [v11 contentView];
    double v13 = [(HUQuickControlStepperSegmentView *)self titleLabel];
    [v12 addSubview:v13];

    double v14 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
    [(HUQuickControlStepperSegmentView *)self addSubview:v14];

    [(HUQuickControlStepperSegmentView *)self _updateTitleLabel];
  }
}

- (void)_updateTitleLabel
{
  v20[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  [v3 setAlignment:1];
  LODWORD(v4) = 1.0;
  [v3 setHyphenationFactor:v4];
  [v3 setLineBreakMode:0];
  double v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:14.0];
  if ([(HUQuickControlStepperSegmentView *)self isSegmentViewHighlighted]
    && [(HUQuickControlStepperSegmentView *)self reachabilityState] == 2)
  {
    uint64_t v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F428B8] systemDarkGrayColor];
  }
  v9 = (void *)v8;
  uint64_t v10 = *MEMORY[0x1E4F42508];
  v19[0] = *MEMORY[0x1E4F42510];
  v19[1] = v10;
  v20[0] = v8;
  v20[1] = v7;
  uint64_t v11 = *MEMORY[0x1E4F24780];
  v19[2] = *MEMORY[0x1E4F42540];
  v19[3] = v11;
  v20[2] = v3;
  v20[3] = v6;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v14 = [(HUQuickControlStepperSegmentView *)self title];
  double v15 = (void *)[v13 initWithString:v14 attributes:v12];
  double v16 = [(HUQuickControlStepperSegmentView *)self titleLabel];
  [v16 setAttributedText:v15];

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]
    && ![(HUQuickControlStepperSegmentView *)self isSegmentViewHighlighted])
  {
    double v17 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
    uint64_t v18 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
    [v18 setEffect:v17];
  }
  else
  {
    double v17 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
    [v17 setEffect:0];
  }
}

- (void)_updateUIHighlightedOverlayView
{
  if ([(HUQuickControlStepperSegmentView *)self isSegmentViewHighlighted]
    && [(HUQuickControlStepperSegmentView *)self reachabilityState] == 2)
  {
    BOOL v3 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];
    double v4 = v3;
    double v5 = 1.0;
  }
  else
  {
    BOOL v3 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];
    double v4 = v3;
    double v5 = 0.0;
  }
  [v3 setAlpha:v5];

  uint64_t v6 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];

  if (v6)
  {
    unint64_t v7 = [(HUQuickControlStepperSegmentView *)self style];
    if (v7)
    {
      double v8 = 0.0;
      if (v7 == 1)
      {
        if ([(HUQuickControlStepperSegmentView *)self segmentLocation] != 1)
        {
          [(HUQuickControlStepperSegmentView *)self cornerRadius];
          double v8 = v9;
        }
        unint64_t v10 = [(HUQuickControlStepperSegmentView *)self segmentLocation];
        if (v10 > 2) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = qword_1BEA1A6E8[v10];
        }
        id v13 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];
        double v14 = [v13 layer];
        [v14 setMaskedCorners:v11];

        double v15 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];
        double v16 = [v15 layer];
        [v16 setShadowOpacity:0.0];
      }
    }
    else
    {
      [(HUQuickControlStepperSegmentView *)self cornerRadius];
      double v8 = v12;
    }
    double v17 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];
    [v17 _setContinuousCornerRadius:v8];
  }
}

uint64_t __67__HUQuickControlStepperSegmentView__updateUIHighlightedOverlayView__block_invoke(uint64_t a1)
{
  unint64_t v1 = [*(id *)(a1 + 32) segmentLocation];
  if (v1 > 2) {
    return 0;
  }
  else {
    return qword_1BEA1A6E8[v1];
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlStepperSegmentView;
  [(HUQuickControlStepperSegmentView *)&v16 layoutSubviews];
  [(HUQuickControlStepperSegmentView *)self frame];
  double v4 = v3 + -16.0;
  [(HUQuickControlStepperSegmentView *)self frame];
  double v6 = v5 + -16.0;
  unint64_t v7 = [(HUQuickControlStepperSegmentView *)self highlightedOverlayView];
  objc_msgSend(v7, "setFrame:", 8.0, 8.0, v4, v6);

  double v8 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
  objc_msgSend(v8, "setFrame:", 10.0, 10.0, v4 + -4.0, v6 + -4.0);

  double v9 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
  [v9 frame];
  double v11 = v10;
  double v12 = [(HUQuickControlStepperSegmentView *)self titleLabelEffectView];
  [v12 frame];
  double v14 = v13;
  double v15 = [(HUQuickControlStepperSegmentView *)self titleLabel];
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v11, v14);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(HUQuickControlStepperSegmentView *)self bounds];
  CGRect v11 = CGRectInset(v10, -10.0, -5.0);
  CGFloat v6 = x;
  CGFloat v7 = y;

  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlStepperSegmentView;
  [(HUQuickControlStepperSegmentView *)&v5 setTintColor:a3];
  double v4 = [(HUQuickControlStepperSegmentView *)self tintColor];
  [(UIView *)self->_highlightedOverlayView setBackgroundColor:v4];
}

- (void)_contentSizeCategoryDidChange
{
  [(HUQuickControlStepperSegmentView *)self _updateTitleLabel];

  [(HUQuickControlStepperSegmentView *)self setNeedsLayout];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlStepperSegmentView;
  [(HUQuickControlStepperSegmentView *)&v4 dealloc];
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isSegmentViewHighlighted
{
  return self->_isSegmentViewHighlighted;
}

- (unint64_t)segmentLocation
{
  return self->_segmentLocation;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
}

- (UIView)highlightedOverlayView
{
  return self->_highlightedOverlayView;
}

- (void)setHighlightedOverlayView:(id)a3
{
}

- (UIVisualEffectView)titleLabelEffectView
{
  return self->_titleLabelEffectView;
}

- (void)setTitleLabelEffectView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabelEffectView, 0);
  objc_storeStrong((id *)&self->_highlightedOverlayView, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end