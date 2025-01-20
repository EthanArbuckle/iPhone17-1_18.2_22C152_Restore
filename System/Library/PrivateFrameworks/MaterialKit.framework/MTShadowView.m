@interface MTShadowView
- ($2F48319983510C38ACA8B723FE61E171)shadowAttributes;
- (BOOL)continuousCorners;
- (CGRect)frameWithContentWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTShadowView)initWithShadowAttributes:(id *)a3 maskCornerRadius:(double)a4;
- (MTShadowView)initWithShadowAttributes:(id *)a3 maskCornerRadius:(double)a4 continuousCorners:(BOOL)a5;
- (UIColor)shadowColor;
- (UIEdgeInsets)shadowOutsets;
- (double)maskCornerRadius;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateShadowOutsetsIfNecessary;
- (void)_updateShadowVisualStyling;
- (void)_validateImage;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setShadowColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTShadowView

- (MTShadowView)initWithShadowAttributes:(id *)a3 maskCornerRadius:(double)a4 continuousCorners:(BOOL)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MTShadowView;
  v8 = [(MTShadowView *)&v13 init];
  v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a3->var1.height;
    *(_OWORD *)&v8->_shadowAttributes.opacity = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v8->_shadowAttributes.offset.height = v10;
    v8->_maskCornerRadius = a4;
    v8->_continuousCorners = a5;
    v11 = [(MTShadowView *)v8 layer];
    [v11 setAllowsHitTesting:0];
  }
  return v9;
}

- (MTShadowView)initWithShadowAttributes:(id *)a3 maskCornerRadius:(double)a4
{
  long long v4 = *(_OWORD *)&a3->var1.height;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v4;
  return [(MTShadowView *)self initWithShadowAttributes:v6 maskCornerRadius:1 continuousCorners:a4];
}

- (UIEdgeInsets)shadowOutsets
{
  [(MTShadowView *)self _updateShadowOutsetsIfNecessary];
  double top = self->_shadowOutsets.top;
  double left = self->_shadowOutsets.left;
  double bottom = self->_shadowOutsets.bottom;
  double right = self->_shadowOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setShadowColor:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    long long v4 = (UIColor *)[v6 copy];
    shadowColor = self->_shadowColor;
    self->_shadowColor = v4;

    [(MTShadowView *)self _updateShadowVisualStyling];
  }
}

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(MTShadowView *)self shadowOutsets];
  v7.n128_u64[0] = v11.n128_u64[0];
  double v8 = v12.n128_f64[0];
  v9.n128_u64[0] = v13.n128_u64[0];
  double v10 = v14.n128_f64[0];
  v11.n128_f64[0] = x;
  v12.n128_f64[0] = y;
  v13.n128_f64[0] = width;
  v14.n128_f64[0] = height;

  MTRectApplyOutsets(v11, v12, v13, v14, v7, v8, v9, v10);
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  BSRectWithSize();
  -[MTShadowView frameWithContentWithFrame:](self, "frameWithContentWithFrame:");
  double v5 = v4;
  double v7 = v6;
  result.CGFloat height = v7;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTShadowView;
  [(MTShadowView *)&v3 layoutSubviews];
  [(MTShadowView *)self _validateImage];
}

- (void)didMoveToSuperview
{
  objc_super v3 = [(MTShadowView *)self superview];

  if (v3)
  {
    [(MTShadowView *)self _updateShadowVisualStyling];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MTShadowView;
  [(MTShadowView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(MTShadowView *)self _updateShadowVisualStyling];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTShadowView;
  [(MTShadowView *)&v12 traitCollectionDidChange:v4];
  double v5 = [(MTShadowView *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9)
  {
    long long v10 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)&self->_shadowOutsets.double top = *MEMORY[0x263F1D1C0];
    *(_OWORD *)&self->_shadowOutsets.double bottom = v10;
    [(MTShadowView *)self setNeedsLayout];
  }
  __n128 v11 = objc_msgSend(MEMORY[0x263F1CB68], "bs_nextViewControllerForView:", self);
  objc_msgSend(v11, "bs_traitCollectionDidChange:forManagedTraitEnvironment:", v4, self);
}

- (void)_updateShadowOutsetsIfNecessary
{
  p_shadowOutsets = &self->_shadowOutsets;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_shadowOutsets.top, *MEMORY[0x263F1D1C0]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_shadowOutsets.bottom, *(float64x2_t *)(MEMORY[0x263F1D1C0] + 16)))), 0xFuLL))))
  {
    objc_super v3 = (void *)MEMORY[0x263F1C6B0];
    p_shadowAttributes = &self->_shadowAttributes;
    double v5 = [(MTShadowView *)self traitCollection];
    [v5 displayScale];
    long long v6 = *(_OWORD *)&p_shadowAttributes->offset.height;
    v11[0] = *(_OWORD *)&p_shadowAttributes->opacity;
    v11[1] = v6;
    objc_msgSend(v3, "mt_edgeOutsetsForShadowProperties:scale:", v11);
    p_shadowOutsets->double top = v7;
    p_shadowOutsets->double left = v8;
    p_shadowOutsets->double bottom = v9;
    p_shadowOutsets->double right = v10;
  }
}

- (void)_validateImage
{
  objc_super v3 = [(MTShadowView *)self image];

  id v4 = [(MTShadowView *)self image];
  [v4 scale];
  double v6 = v5;

  CGFloat v7 = [(MTShadowView *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  [(MTShadowView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  [(MTShadowView *)self shadowOutsets];
  double v16 = v11 - (v14 + v15);
  double v19 = v13 - (v17 + v18);
  if (!v3
    || v6 != v9
    || (MTDimensionsForContinuousCornerRadiusInBounds(),
        uint64_t v26 = v21,
        uint64_t v27 = v20,
        MTResizableAreaForCornerDimensionsInBounds(),
        MTDimensionsForContinuousCornerRadiusInBounds(),
        MTResizableAreaForCornerDimensionsInBounds(),
        !BSSizeEqualToSize())
    || (BSSizeEqualToSize() & 1) == 0)
  {
    self->_maskSizeForCurrentImage.CGFloat width = v16;
    self->_maskSizeForCurrentImage.CGFloat height = v19;
    double maskCornerRadius = self->_maskCornerRadius;
    BOOL continuousCorners = self->_continuousCorners;
    long long v24 = *(_OWORD *)&self->_shadowAttributes.offset.height;
    v28[0] = *(_OWORD *)&self->_shadowAttributes.opacity;
    v28[1] = v24;
    v25 = objc_msgSend(MEMORY[0x263F1C6B0], "mt_resizableShadowTemplateImageWithAttributes:scale:maskCornerRadius:continuousCorners:maskSize:", v28, continuousCorners, v9, maskCornerRadius, v16, v19, v26, v27);
    [(MTShadowView *)self setImage:v25];
  }
}

- (void)_updateShadowVisualStyling
{
  if (self->_shadowColor)
  {
    [(UIView *)self mt_removeAllVisualStyling];
    shadowColor = self->_shadowColor;
    [(MTShadowView *)self setTintColor:shadowColor];
  }
  else
  {
    [(MTShadowView *)self setTintColor:0];
    id v4 = [(MTShadowView *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];
    double v6 = @"platterVibrantShadowLight";
    if (v5 == 2) {
      double v6 = @"platterVibrantShadowDark";
    }
    CGFloat v7 = v6;

    double v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = +[MTVisualStylingProvider _visualStylingProviderForStyleSetNamed:v7 inBundle:v8];

    double v9 = [v10 _visualStylingForStyle:1];
    [(UIView *)self mt_replaceVisualStyling:v9];
  }
}

- ($2F48319983510C38ACA8B723FE61E171)shadowAttributes
{
  long long v3 = *(_OWORD *)&self[18].var1.height;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[18].var0;
  *(_OWORD *)&retstr->var1.CGFloat height = v3;
  return self;
}

- (double)maskCornerRadius
{
  return self->_maskCornerRadius;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void).cxx_destruct
{
}

@end