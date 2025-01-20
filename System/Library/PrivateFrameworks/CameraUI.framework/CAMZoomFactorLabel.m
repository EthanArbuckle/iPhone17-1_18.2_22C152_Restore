@interface CAMZoomFactorLabel
+ (id)_minimizedImageWithScale:(double)a3;
- (BOOL)minimized;
- (BOOL)preferDefaultSizing;
- (BOOL)showZoomFactorSymbol;
- (BOOL)useLeadingZero;
- (CAMZoomFactorLabel)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (UIColor)textColor;
- (UIEdgeInsets)_labelInsets;
- (UIImageView)_minimizedGlyph;
- (UILabel)_label;
- (double)zoomFactor;
- (id)description;
- (void)_updateFont;
- (void)_updateLabelText;
- (void)_updateMinimizedGlyph;
- (void)layoutSubviews;
- (void)setMinimized:(BOOL)a3;
- (void)setPreferDefaultSizing:(BOOL)a3;
- (void)setShowZoomFactorSymbol:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setUseLeadingZero:(BOOL)a3;
- (void)setZoomFactor:(double)a3;
- (void)set_minimizedGlyph:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMZoomFactorLabel

- (CAMZoomFactorLabel)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMZoomFactorLabel;
  v3 = -[CAMZoomFactorLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_showZoomFactorSymbol = 1;
    v3->_useLeadingZero = 1;
    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v4->__label;
    v4->__label = (UILabel *)v6;

    [(UILabel *)v4->__label setTextAlignment:1];
    v8 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v4->__label setTextColor:v8];

    [(UILabel *)v4->__label setAdjustsFontSizeToFitWidth:1];
    [(CAMZoomFactorLabel *)v4 _updateFont];
    [(CAMZoomFactorLabel *)v4 addSubview:v4->__label];
    v9 = v4;
  }

  return v4;
}

- (void)_updateFont
{
  if ([(CAMZoomFactorLabel *)self preferDefaultSizing])
  {
    id v5 = (id)*MEMORY[0x263F83468];
  }
  else
  {
    v3 = [(CAMZoomFactorLabel *)self traitCollection];
    id v5 = [v3 preferredContentSizeCategory];
  }
  +[CAMZoomButton fontSizeForContentSize:v5];
  v4 = +[CAMFont cameraMonospacedFontOfSize:weight:](CAMFont, "cameraMonospacedFontOfSize:weight:");
  [(UILabel *)self->__label setFont:v4];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomFactorLabel;
  v3 = [(CAMZoomFactorLabel *)&v7 description];
  [(CAMZoomFactorLabel *)self zoomFactor];
  id v5 = objc_msgSend(v3, "stringByAppendingFormat:", @" zoomFactor=%f", v4);

  return v5;
}

- (UIColor)textColor
{
  v2 = [(CAMZoomFactorLabel *)self _label];
  v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMZoomFactorLabel *)self _label];
  [v5 setTextColor:v4];
}

- (void)setUseLeadingZero:(BOOL)a3
{
  if (self->_useLeadingZero != a3)
  {
    self->_useLeadingZero = a3;
    [(CAMZoomFactorLabel *)self _updateLabelText];
  }
}

- (void)setPreferDefaultSizing:(BOOL)a3
{
  if (self->_preferDefaultSizing != a3)
  {
    self->_preferDefaultSizing = a3;
    [(CAMZoomFactorLabel *)self _updateFont];
  }
}

- (CGSize)intrinsicContentSize
{
  v3 = [(CAMZoomFactorLabel *)self _label];
  [(CAMZoomFactorLabel *)self _labelInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 intrinsicContentSize];
  double v13 = v12 + v7 + v11;
  double v15 = v14 + v5 + v9;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)_labelInsets
{
  double v2 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v3 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v4 = *(double *)(MEMORY[0x263F834E8] + 24);
  double v5 = CAMPixelWidthForView(self) + -1.0;
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CAMZoomFactorLabel;
  [(CAMZoomFactorLabel *)&v21 layoutSubviews];
  [(CAMZoomFactorLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMZoomFactorLabel *)self _label];
  [(CAMZoomFactorLabel *)self _labelInsets];
  objc_msgSend(v11, "setFrame:", v4 + v15, v6 + v12, v8 - (v15 + v13), v10 - (v12 + v14));
  double v16 = [(CAMZoomFactorLabel *)self _minimizedGlyph];
  double v17 = v16;
  if (v16)
  {
    [v16 bounds];
    v18 = [(CAMZoomFactorLabel *)self traitCollection];
    [v18 displayScale];
    uint64_t v20 = v19;
    UIRectCenteredIntegralRectScale();
    [v17 setFrame:v20];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMZoomFactorLabel *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMZoomFactorLabel *)self _updateFont];
    [(CAMZoomFactorLabel *)self setNeedsLayout];
  }
}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    [(CAMZoomFactorLabel *)self _updateLabelText];
  }
}

- (void)setShowZoomFactorSymbol:(BOOL)a3
{
  if (self->_showZoomFactorSymbol != a3)
  {
    self->_showZoomFactorSymbol = a3;
    [(CAMZoomFactorLabel *)self _updateLabelText];
  }
}

- (void)_updateLabelText
{
  [(CAMZoomFactorLabel *)self zoomFactor];
  if (v3 != 0.0)
  {
    [(CAMZoomFactorLabel *)self zoomFactor];
    id v6 = +[CAMZoomButton textForZoomFactor:[(CAMZoomFactorLabel *)self showZoomFactorSymbol] showZoomFactorSymbol:[(CAMZoomFactorLabel *)self useLeadingZero] useLeadingZero:v4];
    id v5 = [(CAMZoomFactorLabel *)self _label];
    [v5 setText:v6];
  }
}

- (void)setMinimized:(BOOL)a3
{
  if (self->_minimized != a3)
  {
    self->_minimized = a3;
    [(CAMZoomFactorLabel *)self _updateMinimizedGlyph];
  }
}

- (void)_updateMinimizedGlyph
{
  id v8 = [(CAMZoomFactorLabel *)self _minimizedGlyph];
  unsigned int v3 = [(CAMZoomFactorLabel *)self minimized];
  if (v3 && !v8)
  {
    double v4 = objc_opt_class();
    id v5 = [(CAMZoomFactorLabel *)self traitCollection];
    [v5 displayScale];
    id v6 = objc_msgSend(v4, "_minimizedImageWithScale:");

    id v8 = (id)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
    [(CAMZoomFactorLabel *)self addSubview:v8];
    [(CAMZoomFactorLabel *)self set_minimizedGlyph:v8];
  }
  double v7 = [(CAMZoomFactorLabel *)self _label];
  [v7 setAlpha:(double)(v3 ^ 1)];

  [v8 setAlpha:(double)v3];
}

+ (id)_minimizedImageWithScale:(double)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CAMZoomFactorLabel__minimizedImageWithScale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  if (_minimizedImageWithScale__onceToken != -1) {
    dispatch_once(&_minimizedImageWithScale__onceToken, block);
  }
  unsigned int v3 = (void *)_minimizedImageWithScale__dotImage;
  return v3;
}

void __47__CAMZoomFactorLabel__minimizedImageWithScale___block_invoke(uint64_t a1)
{
  v6.width = 3.0;
  v6.height = 3.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, *(CGFloat *)(a1 + 32));
  CurrentContext = UIGraphicsGetCurrentContext();
  double v2 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setFill];

  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 3.0;
  v7.size.height = 3.0;
  CGContextFillEllipseInRect(CurrentContext, v7);
  uint64_t v3 = UIGraphicsGetImageFromCurrentImageContext();
  double v4 = (void *)_minimizedImageWithScale__dotImage;
  _minimizedImageWithScale__dotImage = v3;

  UIGraphicsEndImageContext();
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (BOOL)showZoomFactorSymbol
{
  return self->_showZoomFactorSymbol;
}

- (BOOL)useLeadingZero
{
  return self->_useLeadingZero;
}

- (BOOL)preferDefaultSizing
{
  return self->_preferDefaultSizing;
}

- (BOOL)minimized
{
  return self->_minimized;
}

- (UILabel)_label
{
  return self->__label;
}

- (UIImageView)_minimizedGlyph
{
  return self->__minimizedGlyph;
}

- (void)set_minimizedGlyph:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__minimizedGlyph, 0);
  objc_storeStrong((id *)&self->__label, 0);
}

@end