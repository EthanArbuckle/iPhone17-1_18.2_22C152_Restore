@interface CLKUILegibilityLabel
- (BOOL)legibilityEnabled;
- (CLKUILegibilityLabel)initWithFrame:(CGRect)a3;
- (UIColor)shadowColor;
- (UIEdgeInsets)_contentInsetsFromFonts;
- (double)shadowBlur;
- (void)_updateShadow;
- (void)setLegibilityEnabled:(BOOL)a3;
- (void)setShadowBlur:(double)a3;
- (void)setShadowColor:(id)a3;
@end

@implementation CLKUILegibilityLabel

- (CLKUILegibilityLabel)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLKUILegibilityLabel;
  v3 = -[CLKUILegibilityLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_sBlur = 5.0;
    uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    sColor = v4->_sColor;
    v4->_sColor = (UIColor *)v5;
  }
  return v4;
}

- (void)setShadowBlur:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_sBlur = a3;
    if (self->_legibilityEnabled)
    {
      [(CLKUILegibilityLabel *)self _updateShadow];
    }
  }
}

- (double)shadowBlur
{
  return self->_sBlur;
}

- (void)setShadowColor:(id)a3
{
  id v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sColor, a3);
    if (self->_legibilityEnabled) {
      [(CLKUILegibilityLabel *)self _updateShadow];
    }
  }
}

- (UIColor)shadowColor
{
  return self->_sColor;
}

- (void)setLegibilityEnabled:(BOOL)a3
{
  if (self->_legibilityEnabled != a3)
  {
    self->_legibilityEnabled = a3;
    [(CLKUILegibilityLabel *)self _updateShadow];
  }
}

- (void)_updateShadow
{
  if (self->_legibilityEnabled)
  {
    sColor = self->_sColor;
    v9.receiver = self;
    v9.super_class = (Class)CLKUILegibilityLabel;
    [(CLKUILegibilityLabel *)&v9 setShadowColor:sColor];
    double sBlur = self->_sBlur;
    v8.receiver = self;
    v8.super_class = (Class)CLKUILegibilityLabel;
    [(CLKUILegibilityLabel *)&v8 setShadowBlur:sBlur];
    v7.receiver = self;
    v7.super_class = (Class)CLKUILegibilityLabel;
    -[CLKUILegibilityLabel setShadowOffset:](&v7, sel_setShadowOffset_, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CLKUILegibilityLabel;
    [(CLKUILegibilityLabel *)&v6 setShadowColor:0];
    v5.receiver = self;
    v5.super_class = (Class)CLKUILegibilityLabel;
    [(CLKUILegibilityLabel *)&v5 setShadowBlur:0.0];
  }
  [(CLKUILegibilityLabel *)self _invalidateLabelSize];
}

- (UIEdgeInsets)_contentInsetsFromFonts
{
  v8.receiver = self;
  v8.super_class = (Class)CLKUILegibilityLabel;
  [(CLKUILegibilityLabel *)&v8 _contentInsetsFromFonts];
  if (self->_legibilityEnabled)
  {
    double sBlur = self->_sBlur;
    double v5 = v5 - sBlur;
    double v3 = v3 - sBlur;
    double v4 = v4 - sBlur;
    double v6 = v6 - sBlur;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)legibilityEnabled
{
  return self->_legibilityEnabled;
}

- (void).cxx_destruct
{
}

@end