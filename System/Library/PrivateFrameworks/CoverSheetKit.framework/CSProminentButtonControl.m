@interface CSProminentButtonControl
- (BOOL)clickInteractionShouldBegin:(id)a3;
- (BOOL)isClickSuppressed;
- (BOOL)shouldAnimateBackgroundDuringInteraction;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CSProminentButtonControl)initWithFrame:(CGRect)a3;
- (CSProminentButtonControl)initWithFrame:(CGRect)a3 luminanceMap:(id)a4;
- (CSProminentButtonControlEmbeddedView)glyphView;
- (NSString)backgroundEffectViewGroupName;
- (NSString)statisticsIdentifier;
- (UIEdgeInsets)edgeInsets;
- (UIImage)luminanceMap;
- (UIVisualEffectView)backgroundEffectView;
- (double)containerCornerRadius;
- (double)highlightProgress;
- (double)scaleValue;
- (id)_backgroundEffectsWithBrightness:(double)a3;
- (id)_defaultLuminanceMap;
- (id)copyBackgroundVisualEffectView;
- (id)copyWithoutGlyphView;
- (id)highlightEffectForClickInteraction:(id)a3;
- (unint64_t)_clickInteractionDefaultDriverType:(id)a3;
- (void)_animateEffectUpdateWithProgress:(double)a3 ended:(BOOL)a4;
- (void)_setBackgroundEffectView:(id)a3;
- (void)_updateStyle;
- (void)clickInteraction:(id)a3 didObserveForce:(double)maxForceDuringInteraction;
- (void)clickInteractionDidClickUp:(id)a3;
- (void)clickInteractionDidEnd:(id)a3;
- (void)layoutBackgroundEffectView;
- (void)layoutIfNeededAnimated;
- (void)layoutSubviews;
- (void)setBackgroundEffectViewGroupName:(id)a3;
- (void)setClickSuppressed:(BOOL)a3;
- (void)setContainerCornerRadius:(double)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setGlyphView:(id)a3;
- (void)setHighlightProgress:(double)a3;
- (void)setLuminanceMap:(id)a3;
- (void)setScaleValue:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldAnimateBackgroundDuringInteraction:(BOOL)a3;
- (void)setStatisticsIdentifier:(id)a3;
@end

@implementation CSProminentButtonControl

- (double)containerCornerRadius
{
  [(UIView *)self->_containerView bounds];
  double v4 = v3;
  [(UIView *)self->_containerView bounds];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  return v6 * 0.5;
}

- (void)layoutBackgroundEffectView
{
  [(CSProminentButtonControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CSProminentButtonControl *)self edgeInsets];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 - (v11 + v15);
  CGFloat v18 = v10 - (v13 + v17);
  v30.origin.x = v12;
  v30.origin.y = v14;
  v30.size.width = v16;
  v30.size.height = v18;
  CGRectGetWidth(v30);
  v31.origin.x = v12;
  v31.origin.y = v14;
  v31.size.width = v16;
  v31.size.height = v18;
  CGRectGetHeight(v31);
  UIRectGetCenter();
  v19 = [(CSProminentButtonControl *)self traitCollection];
  [v19 displayScale];
  UIRectCenteredAboutPointScale();
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  -[UIVisualEffectView setFrame:](self->_backgroundEffectView, "setFrame:", v21, v23, v25, v27);
  id v28 = [(UIVisualEffectView *)self->_backgroundEffectView contentView];
  [v28 setAlpha:self->_highlightProgress * 0.5 + 0.0];
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CSProminentButtonControl;
  [(CSProminentButtonControl *)&v36 layoutSubviews];
  [(CSProminentButtonControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CSProminentButtonControl *)self edgeInsets];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  v37.origin.x = v12;
  v37.origin.y = v14;
  v37.size.width = v16;
  v37.size.height = v18;
  double Width = CGRectGetWidth(v37);
  v38.origin.x = v12;
  v38.origin.y = v14;
  v38.size.width = v16;
  v38.size.height = v18;
  double Height = CGRectGetHeight(v38);
  [(CSProminentButtonControl *)self bounds];
  double MidX = CGRectGetMidX(v39);
  [(CSProminentButtonControl *)self bounds];
  double MidY = CGRectGetMidY(v40);
  -[UIView setBounds:](self->_containerView, "setBounds:", 0.0, 0.0, Width, Height);
  -[UIView setCenter:](self->_containerView, "setCenter:", MidX, MidY);
  uint64_t v23 = [(CSProminentButtonControl *)self isSelected];
  double v24 = &OBJC_IVAR___CSProminentButtonControl__backgroundEffects;
  if (v23) {
    double v24 = &OBJC_IVAR___CSProminentButtonControl__selectedBackgroundEffects;
  }
  [(UIVisualEffectView *)self->_backgroundEffectView setBackgroundEffects:*(Class *)((char *)&self->super.super.super.super.isa + *v24)];
  double v25 = [(UIVisualEffectView *)self->_backgroundEffectView contentView];
  [v25 setHidden:v23];

  [(CSProminentButtonControl *)self layoutBackgroundEffectView];
  -[CSProminentButtonControlEmbeddedView sizeThatFits:](self->_glyphView, "sizeThatFits:", v16, v18);
  UIRectGetCenter();
  double v26 = [(CSProminentButtonControl *)self traitCollection];
  [v26 displayScale];
  UIRectCenteredAboutPointScale();
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  -[CSProminentButtonControlEmbeddedView setFrame:](self->_glyphView, "setFrame:", v28, v30, v32, v34);
  [(CSProminentButtonControl *)self setScaleValue:self->_highlightProgress * 0.6 + 1.0];
  containerView = self->_containerView;
  [(CSProminentButtonControl *)self containerCornerRadius];
  -[UIView _setContinuousCornerRadius:](containerView, "_setContinuousCornerRadius:");
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setScaleValue:(double)a3
{
  self->_scaleValue = a3;
  containerView = self->_containerView;
  CGAffineTransformMakeScale(&v4, a3, a3);
  [(UIView *)containerView setTransform:&v4];
}

- (CSProminentButtonControl)initWithFrame:(CGRect)a3
{
  return -[CSProminentButtonControl initWithFrame:luminanceMap:](self, "initWithFrame:luminanceMap:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CSProminentButtonControl)initWithFrame:(CGRect)a3 luminanceMap:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CSProminentButtonControl;
  double v11 = -[CSProminentButtonControl initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    CGFloat v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [v11 setTintColor:v12];

    [v11 setClipsToBounds:0];
    double v13 = [MEMORY[0x1E4FB1618] clearColor];
    [v11 setBackgroundColor:v13];

    [v11 setOpaque:0];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)(v11 + 568) = *MEMORY[0x1E4FB2848];
    *(_OWORD *)(v11 + 584) = v14;
    [v11 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v15, v17, v19, v21);
    [v23 setAutoresizingMask:18];
    double v24 = [MEMORY[0x1E4FB1618] clearColor];
    [v23 setBackgroundColor:v24];

    [v23 setOpaque:0];
    [v23 setClipsToBounds:1];
    [v23 setUserInteractionEnabled:0];
    [v11 addSubview:v23];
    double v25 = (void *)*((void *)v11 + 57);
    *((void *)v11 + 57) = v23;

    double v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1F00]), "initWithFrame:", v16, v18, v20, v22);
    [v26 setAutoresizingMask:18];
    [v26 setClipsToBounds:1];
    [v26 setUserInteractionEnabled:0];
    [*((id *)v11 + 57) addSubview:v26];
    double v27 = (void *)*((void *)v11 + 69);
    *((void *)v11 + 69) = v26;

    double v28 = [*((id *)v11 + 69) contentView];
    double v29 = [MEMORY[0x1E4FB1618] colorWithRed:0.031372549 green:0.031372549 blue:0.031372549 alpha:1.0];
    [v28 setBackgroundColor:v29];

    double v30 = [*((id *)v11 + 69) contentView];
    [v30 setAlpha:0.0];

    objc_storeStrong((id *)v11 + 68, a4);
    uint64_t v31 = [v11 _backgroundEffectsWithBrightness:-0.13];
    double v32 = (void *)*((void *)v11 + 58);
    *((void *)v11 + 58) = v31;

    uint64_t v33 = [v11 _backgroundEffectsWithBrightness:0.65];
    double v34 = (void *)*((void *)v11 + 59);
    *((void *)v11 + 59) = v33;

    id v35 = objc_alloc_init(MEMORY[0x1E4FB2030]);
    [v35 setDelegate:v11];
    objc_super v36 = (void *)*((void *)v11 + 60);
    *((void *)v11 + 60) = v35;

    [v11 addInteraction:*((void *)v11 + 60)];
    [*((id *)v11 + 60) setDriverCancelsTouchesInView:0];
    CGRect v37 = v11;
  }

  return (CSProminentButtonControl *)v11;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(CSProminentButtonControl *)self setNeedsLayout];
  }
}

- (void)setGlyphView:(id)a3
{
  double v5 = (CSProminentButtonControlEmbeddedView *)a3;
  p_glyphView = (id *)&self->_glyphView;
  glyphView = self->_glyphView;
  double v9 = v5;
  if (glyphView != v5)
  {
    [(CSProminentButtonControlEmbeddedView *)glyphView removeFromSuperview];
    objc_storeStrong((id *)&self->_glyphView, a3);
    id v8 = *p_glyphView;
    [(UIView *)self->_containerView bounds];
    objc_msgSend(v8, "setFrame:");
    [*p_glyphView setAutoresizingMask:18];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(*p_glyphView, "setSelected:", -[CSProminentButtonControl isSelected](self, "isSelected"));
    }
    if (*p_glyphView)
    {
      -[UIView addSubview:](self->_containerView, "addSubview:");
      [(CSProminentButtonControl *)self setNeedsLayout];
      [(CSProminentButtonControl *)self layoutIfNeeded];
    }
  }
}

- (void)_updateStyle
{
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  if ([(CSProminentButtonControl *)self isSelected])
  {
    id v3 = [MEMORY[0x1E4FB1618] blackColor];
  }
  else
  {
    id v3 = v6;
  }
  CGAffineTransform v4 = v3;
  double v5 = [v3 colorWithAlphaComponent:1.0];

  [(CSProminentButtonControl *)self setTintColor:v5];
}

- (void)setContainerCornerRadius:(double)a3
{
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSProminentButtonControl *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CSProminentButtonControl;
    [(CSProminentButtonControl *)&v5 setSelected:v3];
    [(CSProminentButtonControl *)self setNeedsLayout];
    [(CSProminentButtonControl *)self _updateStyle];
    if (objc_opt_respondsToSelector()) {
      [(CSProminentButtonControlEmbeddedView *)self->_glyphView setSelected:[(CSProminentButtonControl *)self isSelected]];
    }
    [(CSProminentButtonControl *)self layoutIfNeededAnimated];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float64x2_t v3 = vaddq_f64(vaddq_f64(*(float64x2_t *)&self->_edgeInsets.top, *(float64x2_t *)&self->_edgeInsets.bottom), (float64x2_t)vdupq_n_s64(0x4049000000000000uLL));
  double v4 = v3.f64[1];
  result.double height = v3.f64[0];
  result.double width = v4;
  return result;
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  double v4 = (_UIClickInteraction *)a3;
  if (self->_clickInteraction == v4 && !self->_clickSuppressed)
  {
    BOOL v5 = 1;
    self->_interactive = 1;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    [(CSProminentButtonControl *)self setNeedsLayout];
    [(CSProminentButtonControl *)self layoutIfNeededAnimated];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)clickInteractionDidClickUp:(id)a3
{
  if (self->_clickInteraction == a3)
  {
    [(CSProminentButtonControl *)self setSelected:[(CSProminentButtonControl *)self isSelected] ^ 1];
    [(CSProminentButtonControl *)self sendActionsForControlEvents:0x2000];
    if (self->_interactive) {
      self->_didActivateDuringInteraction = 1;
    }
  }
}

- (void)clickInteraction:(id)a3 didObserveForce:(double)maxForceDuringInteraction
{
  if (self->_interactive)
  {
    if (self->_maxForceDuringInteraction >= maxForceDuringInteraction) {
      maxForceDuringInteraction = self->_maxForceDuringInteraction;
    }
    self->_maxForceDuringInteraction = maxForceDuringInteraction;
  }
}

- (void)clickInteractionDidEnd:(id)a3
{
  if (self->_clickInteraction == a3)
  {
    self->_interactive = 0;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    [(CSProminentButtonControl *)self setNeedsLayout];
    [(CSProminentButtonControl *)self layoutIfNeededAnimated];
    if ([(CSProminentButtonControl *)self shouldAnimateBackgroundDuringInteraction])
    {
      [(UIVisualEffectView *)self->_backgroundEffectView setAlpha:1.0];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __51__CSProminentButtonControl_clickInteractionDidEnd___block_invoke;
      v4[3] = &unk_1E5E8A4B8;
      v4[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:2.0];
    }
  }
}

uint64_t __51__CSProminentButtonControl_clickInteractionDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:0.0];
}

- (unint64_t)_clickInteractionDefaultDriverType:(id)a3
{
  float64x2_t v3 = [(CSProminentButtonControl *)self traitCollection];
  uint64_t v4 = [v3 forceTouchCapability];

  if (v4 == 2) {
    return 4;
  }
  else {
    return 3;
  }
}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FB2228]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CSProminentButtonControl_highlightEffectForClickInteraction___block_invoke;
  v8[3] = &unk_1E5E8A4E0;
  objc_copyWeak(&v9, &location);
  id v6 = (void *)[v5 initWithProgressBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __63__CSProminentButtonControl_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 progress];
  double v5 = v4;
  uint64_t v6 = [v3 ended];

  [WeakRetained _animateEffectUpdateWithProgress:v6 ended:v5];
}

- (void)_animateEffectUpdateWithProgress:(double)a3 ended:(BOOL)a4
{
  double v4 = a3 + a3 + 18.0;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[2] = __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke;
  v5[3] = &unk_1E5E8A508;
  if (a4) {
    double v4 = v4 + 4.0;
  }
  v5[4] = self;
  *(double *)&v5[5] = a3;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:v5 interactive:0 animations:500.0 completion:v4];
}

uint64_t __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke_2;
  v4[3] = &unk_1E5E8A508;
  v4[4] = *(void *)(a1 + 32);
  void v4[5] = *(void *)(a1 + 40);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 505))
  {
    [*(id *)(v2 + 552) setAlpha:*(double *)(a1 + 40)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  double v3 = *(double *)(a1 + 40);
  if (v3 > 1.2) {
    double v3 = 1.2;
  }
  [(id)v2 setHighlightProgress:v3];
  [*(id *)(a1 + 32) setNeedsLayout];
  double v4 = *(void **)(a1 + 32);

  return [v4 layoutIfNeeded];
}

- (void)setShouldAnimateBackgroundDuringInteraction:(BOOL)a3
{
  if (self->_shouldAnimateBackgroundDuringInteraction != a3)
  {
    self->_shouldAnimateBackgroundDuringInteraction = a3;
    backgroundEffectView = self->_backgroundEffectView;
    double v4 = 1.0;
    if (a3) {
      double v4 = 0.0;
    }
    [(UIVisualEffectView *)backgroundEffectView setAlpha:v4];
  }
}

- (void)layoutIfNeededAnimated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke;
  v2[3] = &unk_1E5E8A4B8;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v2 options:0 animations:0.0 completion:0.0];
}

uint64_t __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke_2;
  v4[3] = &unk_1E5E8A4B8;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)_backgroundEffectsWithBrightness:(double)a3
{
  v16[5] = *MEMORY[0x1E4F143B8];
  CAFrameRateRange v5 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:30.0];
  uint64_t v6 = (void *)MEMORY[0x1E4FB1EF8];
  double v7 = objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", v5);
  id v8 = [v6 effectCompositingColor:v7 withMode:4 alpha:0.12];
  v16[1] = v8;
  id v9 = (void *)MEMORY[0x1E4FB1620];
  id v10 = [(CSProminentButtonControl *)self luminanceMap];
  double v11 = [v9 colorEffectLuminanceMap:v10 blendingAmount:0.7];
  v16[2] = v11;
  CGFloat v12 = [MEMORY[0x1E4FB1620] colorEffectSaturate:2.8];
  v16[3] = v12;
  double v13 = [MEMORY[0x1E4FB1620] colorEffectBrightness:a3];
  v16[4] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];

  return v14;
}

- (void)setBackgroundEffectViewGroupName:(id)a3
{
}

- (UIImage)luminanceMap
{
  luminanceMap = self->_luminanceMap;
  if (luminanceMap)
  {
    double v3 = luminanceMap;
  }
  else
  {
    double v3 = [(CSProminentButtonControl *)self _defaultLuminanceMap];
  }

  return v3;
}

- (id)_defaultLuminanceMap
{
  return (id)[MEMORY[0x1E4FB1818] kitImageNamed:@"UICoverSheetButtonLuminanceMap"];
}

- (id)copyBackgroundVisualEffectView
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithoutGlyphView
{
  id v3 = objc_alloc((Class)objc_opt_class());
  [(CSProminentButtonControl *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat v12 = [(CSProminentButtonControl *)self luminanceMap];
  double v13 = objc_msgSend(v3, "initWithFrame:luminanceMap:", v12, v5, v7, v9, v11);

  [(CSProminentButtonControl *)self edgeInsets];
  objc_msgSend(v13, "setEdgeInsets:");
  [(CSProminentButtonControl *)self highlightProgress];
  objc_msgSend(v13, "setHighlightProgress:");
  id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
  double v15 = [(CSProminentButtonControl *)self backgroundEffectView];
  double v16 = [v15 backgroundEffects];
  double v17 = (void *)[v14 initWithArray:v16 copyItems:1];

  double v18 = [v13 backgroundEffectView];
  [v18 setBackgroundEffects:v17];

  double v19 = [(CSProminentButtonControl *)self backgroundEffectViewGroupName];
  [v13 setBackgroundEffectViewGroupName:v19];

  double v20 = [(CSProminentButtonControl *)self tintColor];
  [v13 setTintColor:v20];

  [(CSProminentButtonControl *)self alpha];
  objc_msgSend(v13, "setAlpha:");
  objc_msgSend(v13, "setSelected:", -[CSProminentButtonControl isSelected](self, "isSelected"));
  objc_msgSend(v13, "setEnabled:", -[CSProminentButtonControl isEnabled](self, "isEnabled"));
  objc_msgSend(v13, "setHidden:", -[CSProminentButtonControl isHidden](self, "isHidden"));
  [(CSProminentButtonControl *)self _continuousCornerRadius];
  objc_msgSend(v13, "_setContinuousCornerRadius:");
  [v13 setNeedsLayout];

  return v13;
}

- (double)scaleValue
{
  return self->_scaleValue;
}

- (BOOL)isClickSuppressed
{
  return self->_clickSuppressed;
}

- (void)setClickSuppressed:(BOOL)a3
{
  self->_clickSuppressed = a3;
}

- (CSProminentButtonControlEmbeddedView)glyphView
{
  return self->_glyphView;
}

- (NSString)backgroundEffectViewGroupName
{
  return self->_backgroundEffectViewGroupName;
}

- (NSString)statisticsIdentifier
{
  return self->_statisticsIdentifier;
}

- (void)setStatisticsIdentifier:(id)a3
{
}

- (void)setLuminanceMap:(id)a3
{
}

- (BOOL)shouldAnimateBackgroundDuringInteraction
{
  return self->_shouldAnimateBackgroundDuringInteraction;
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)_setBackgroundEffectView:(id)a3
{
}

- (double)highlightProgress
{
  return self->_highlightProgress;
}

- (void)setHighlightProgress:(double)a3
{
  self->_highlightProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_luminanceMap, 0);
  objc_storeStrong((id *)&self->_statisticsIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundEffectViewGroupName, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_clickInteraction, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end