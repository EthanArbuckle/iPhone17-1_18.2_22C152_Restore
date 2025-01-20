@interface HUQuickControlSliderValueOverlayView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)hasSecondGrabber;
- (BOOL)isOff;
- (BOOL)showGrabbers;
- (CAShapeLayer)primaryGrabberShadowLayer;
- (CAShapeLayer)secondaryGrabberShadowLayer;
- (HUQuickControlSliderValueOverlayView)initWithFrame:(CGRect)a3;
- (UIColor)layerColor;
- (UIView)topBorder;
- (id)_createGrabberShadowLayer;
- (unint64_t)controlSize;
- (unint64_t)primaryGrabberLocation;
- (void)_updateBlendMode;
- (void)_updateShape;
- (void)layoutSubviews;
- (void)setControlSize:(unint64_t)a3;
- (void)setHasSecondGrabber:(BOOL)a3;
- (void)setLayerColor:(id)a3;
- (void)setOff:(BOOL)a3;
- (void)setPrimaryGrabberLocation:(unint64_t)a3;
- (void)setPrimaryGrabberShadowLayer:(id)a3;
- (void)setSecondaryGrabberShadowLayer:(id)a3;
- (void)setShowGrabbers:(BOOL)a3;
- (void)setTopBorder:(id)a3;
@end

@implementation HUQuickControlSliderValueOverlayView

- (void)setLayerColor:(id)a3
{
  objc_storeStrong((id *)&self->_layerColor, a3);
  id v5 = a3;
  [(HUQuickControlSliderValueOverlayView *)self _updateBlendMode];
  id v10 = [(HUQuickControlSliderValueOverlayView *)self traitCollection];
  [v10 userInterfaceStyle];
  int v6 = [(HUQuickControlSliderValueOverlayView *)self isOff];
  v8 = borderColorSurroundingColor(v5, v7, v6);

  v9 = [(HUQuickControlSliderValueOverlayView *)self topBorder];
  [v9 setBackgroundColor:v8];
}

- (UIColor)layerColor
{
  return self->_layerColor;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (HUQuickControlSliderValueOverlayView)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlSliderValueOverlayView;
  v4 = -[HUQuickControlSliderValueOverlayView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = v4;
  if (v4)
  {
    v4->_showGrabbers = 1;
    uint64_t v6 = *MEMORY[0x1E4F39FB8];
    uint64_t v7 = [(HUQuickControlSliderValueOverlayView *)v4 layer];
    [v7 setFillRule:v6];

    v8 = [(HUQuickControlSliderValueOverlayView *)v5 layer];
    [v8 setMasksToBounds:1];

    [(HUQuickControlSliderValueOverlayView *)v5 setPrimaryGrabberLocation:0];
    uint64_t v9 = objc_opt_new();
    topBorder = v5->_topBorder;
    v5->_topBorder = (UIView *)v9;

    -[UIView setFrame:](v5->_topBorder, "setFrame:", 0.0, 0.0, width, 5.0);
    [(HUQuickControlSliderValueOverlayView *)v5 addSubview:v5->_topBorder];
    [(HUQuickControlSliderValueOverlayView *)v5 _updateShape];
    [(HUQuickControlSliderValueOverlayView *)v5 _updateBlendMode];
  }
  return v5;
}

- (void)setOff:(BOOL)a3
{
  if (self->_off != a3)
  {
    self->_off = a3;
    [(HUQuickControlSliderValueOverlayView *)self _updateBlendMode];
  }
  id v9 = [(HUQuickControlSliderValueOverlayView *)self layerColor];
  v4 = [(HUQuickControlSliderValueOverlayView *)self traitCollection];
  [v4 userInterfaceStyle];
  int v5 = [(HUQuickControlSliderValueOverlayView *)self isOff];
  uint64_t v7 = borderColorSurroundingColor(v9, v6, v5);
  v8 = [(HUQuickControlSliderValueOverlayView *)self topBorder];
  [v8 setBackgroundColor:v7];
}

- (void)setShowGrabbers:(BOOL)a3
{
  if (self->_showGrabbers != a3)
  {
    self->_showGrabbers = a3;
    [(HUQuickControlSliderValueOverlayView *)self setNeedsLayout];
  }
}

- (void)setHasSecondGrabber:(BOOL)a3
{
  if (self->_hasSecondGrabber != a3)
  {
    self->_hasSecondGrabber = a3;
    [(HUQuickControlSliderValueOverlayView *)self setNeedsLayout];
  }
}

- (void)setPrimaryGrabberLocation:(unint64_t)a3
{
  if (self->_primaryGrabberLocation != a3)
  {
    self->_primaryGrabberLocation = a3;
    [(HUQuickControlSliderValueOverlayView *)self setNeedsLayout];
  }
}

- (void)setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    [(HUQuickControlSliderValueOverlayView *)self setNeedsLayout];
  }
}

- (void)_updateShape
{
  v3 = (void *)MEMORY[0x1E4F427D0];
  [(HUQuickControlSliderValueOverlayView *)self bounds];
  v4 = objc_msgSend(v3, "bezierPathWithRect:");
  if ([(HUQuickControlSliderValueOverlayView *)self showGrabbers])
  {
    unint64_t v5 = [(HUQuickControlSliderValueOverlayView *)self controlSize];
    [(HUQuickControlSliderValueOverlayView *)self bounds];
    double v7 = 0.65;
    if (v5 != 2) {
      double v7 = 0.75;
    }
    double v8 = v7 * v6;
    [(HUQuickControlSliderValueOverlayView *)self bounds];
    double v9 = CGRectGetMidX(v33) + v8 * -0.5;
    unint64_t v10 = [(HUQuickControlSliderValueOverlayView *)self primaryGrabberLocation];
    double v11 = 18.0;
    if (v10 == 1)
    {
      [(HUQuickControlSliderValueOverlayView *)self bounds];
      double v11 = v12 - 10.0 + -18.0;
    }
    v13 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v8, 10.0, 5.0);
    [v4 appendPath:v13];
    [(HUQuickControlSliderValueOverlayView *)self bounds];
    if (v14 > 0.0)
    {
      v15 = [(HUQuickControlSliderValueOverlayView *)self primaryGrabberShadowLayer];

      if (!v15)
      {
        v16 = [(HUQuickControlSliderValueOverlayView *)self _createGrabberShadowLayer];
        [(HUQuickControlSliderValueOverlayView *)self setPrimaryGrabberShadowLayer:v16];
        v17 = [(HUQuickControlSliderValueOverlayView *)self layer];
        [v17 insertSublayer:v16 atIndex:0];
      }
    }
    id v18 = v13;
    uint64_t v19 = [v18 CGPath];
    v20 = [(HUQuickControlSliderValueOverlayView *)self primaryGrabberShadowLayer];
    [v20 setPath:v19];

    if ([(HUQuickControlSliderValueOverlayView *)self hasSecondGrabber])
    {
      [(HUQuickControlSliderValueOverlayView *)self bounds];
      v21 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", v9, CGRectGetMaxY(v34) + -28.0, v8, 10.0, 5.0);
      [v4 appendPath:v21];
      [(HUQuickControlSliderValueOverlayView *)self bounds];
      if (v22 > 0.0)
      {
        v23 = [(HUQuickControlSliderValueOverlayView *)self secondaryGrabberShadowLayer];

        if (!v23)
        {
          v24 = [(HUQuickControlSliderValueOverlayView *)self _createGrabberShadowLayer];
          [(HUQuickControlSliderValueOverlayView *)self setSecondaryGrabberShadowLayer:v24];
          v25 = [(HUQuickControlSliderValueOverlayView *)self layer];
          [v25 insertSublayer:v24 atIndex:0];
        }
      }
      id v26 = v21;
      uint64_t v27 = [v26 CGPath];
      v28 = [(HUQuickControlSliderValueOverlayView *)self secondaryGrabberShadowLayer];
      [v28 setPath:v27];
    }
    uint64_t v29 = [v4 CGPath];
    v30 = [(HUQuickControlSliderValueOverlayView *)self layer];
    [v30 setPath:v29];
  }
  else
  {
    uint64_t v31 = [v4 CGPath];
    v32 = [(HUQuickControlSliderValueOverlayView *)self layer];
    [v32 setPath:v31];
  }
}

double __52__HUQuickControlSliderValueOverlayView__updateShape__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) primaryGrabberLocation];
  double result = 18.0;
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds", 18.0);
    return v4 - *(double *)(a1 + 40) + -18.0;
  }
  return result;
}

- (id)_createGrabberShadowLayer
{
  uint64_t v2 = [MEMORY[0x1E4F39C88] layer];
  [v2 setShadowRadius:10.0];
  LODWORD(v3) = *(_DWORD *)"333?";
  [v2 setShadowOpacity:v3];
  id v4 = [MEMORY[0x1E4F428B8] darkGrayColor];
  objc_msgSend(v2, "setShadowColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_msgSend(v2, "setFillColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v2, "setShadowOffset:", 0.0, 5.0);

  return v2;
}

- (void)_updateBlendMode
{
  if ([(HUQuickControlSliderValueOverlayView *)self isOff]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  id v5 = [(HUQuickControlSliderValueOverlayView *)self layerColor];
  }
  uint64_t v3 = [v5 CGColor];
  id v4 = [(HUQuickControlSliderValueOverlayView *)self layer];
  [v4 setFillColor:v3];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlSliderValueOverlayView;
  [(HUQuickControlSliderValueOverlayView *)&v11 layoutSubviews];
  [(HUQuickControlSliderValueOverlayView *)self _updateShape];
  uint64_t v3 = [(HUQuickControlSliderValueOverlayView *)self topBorder];
  [v3 frame];
  double v5 = v4;
  [(HUQuickControlSliderValueOverlayView *)self bounds];
  double v7 = v6;

  if (v5 < v7)
  {
    [(HUQuickControlSliderValueOverlayView *)self bounds];
    double v9 = v8;
    unint64_t v10 = [(HUQuickControlSliderValueOverlayView *)self topBorder];
    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v9, 1.0);
  }
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
    v7.super_class = (Class)HUQuickControlSliderValueOverlayView;
    BOOL v5 = [(HUQuickControlSliderValueOverlayView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (BOOL)isOff
{
  return self->_off;
}

- (BOOL)hasSecondGrabber
{
  return self->_hasSecondGrabber;
}

- (BOOL)showGrabbers
{
  return self->_showGrabbers;
}

- (unint64_t)primaryGrabberLocation
{
  return self->_primaryGrabberLocation;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (CAShapeLayer)primaryGrabberShadowLayer
{
  return self->_primaryGrabberShadowLayer;
}

- (void)setPrimaryGrabberShadowLayer:(id)a3
{
}

- (CAShapeLayer)secondaryGrabberShadowLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryGrabberShadowLayer);

  return (CAShapeLayer *)WeakRetained;
}

- (void)setSecondaryGrabberShadowLayer:(id)a3
{
}

- (UIView)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_destroyWeak((id *)&self->_secondaryGrabberShadowLayer);
  objc_storeStrong((id *)&self->_primaryGrabberShadowLayer, 0);

  objc_storeStrong((id *)&self->_layerColor, 0);
}

@end