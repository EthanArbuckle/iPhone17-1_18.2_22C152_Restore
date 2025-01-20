@interface MUVerifiedLogoImageView
- (MUVerifiedLogoImageView)initWithFrame:(CGRect)a3;
- (UIColor)innerRingColor;
- (UIColor)outerRingColor;
- (void)_setupCustomBorder;
- (void)_updateInnerRingFrame;
- (void)_updateRingColors;
- (void)layoutSubviews;
@end

@implementation MUVerifiedLogoImageView

- (MUVerifiedLogoImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUVerifiedLogoImageView;
  v3 = -[MUImageView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3) {
    [(MUVerifiedLogoImageView *)v3 _setupCustomBorder];
  }
  return v4;
}

- (void)_setupCustomBorder
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MUVerifiedLogoImageView *)self layer];
  [v3 setMasksToBounds:1];

  v4 = [(MUVerifiedLogoImageView *)self layer];
  [v4 setBorderWidth:2.0];

  v5 = [MEMORY[0x1E4F39C88] layer];
  innerRingLayer = self->_innerRingLayer;
  self->_innerRingLayer = v5;

  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  -[CAShapeLayer setFillColor:](self->_innerRingLayer, "setFillColor:", [v7 CGColor]);

  [(CAShapeLayer *)self->_innerRingLayer setLineWidth:1.0];
  v8 = [(MUVerifiedLogoImageView *)self layer];
  [v8 addSublayer:self->_innerRingLayer];

  [(MUVerifiedLogoImageView *)self _updateInnerRingFrame];
  [(MUVerifiedLogoImageView *)self _updateRingColors];
  v11[0] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v10 = (id)[(MUVerifiedLogoImageView *)self registerForTraitChanges:v9 withAction:sel__updateRingColors];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MUVerifiedLogoImageView;
  [(MUImageView *)&v5 layoutSubviews];
  [(MUVerifiedLogoImageView *)self _updateInnerRingFrame];
  [(MUVerifiedLogoImageView *)self bounds];
  CGFloat v3 = CGRectGetWidth(v6) * 0.5;
  v4 = [(MUVerifiedLogoImageView *)self layer];
  [v4 setCornerRadius:v3];
}

- (void)_updateInnerRingFrame
{
  [(MUVerifiedLogoImageView *)self bounds];
  CGRect v10 = CGRectInset(v9, 2.5, 2.5);
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  [(MUVerifiedLogoImageView *)self bounds];
  -[CAShapeLayer setFrame:](self->_innerRingLayer, "setFrame:");
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, width, height);
  id v7 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_innerRingLayer, "setPath:", [v7 CGPath]);
}

- (void)_updateRingColors
{
  id v3 = [(MUVerifiedLogoImageView *)self innerRingColor];
  -[CAShapeLayer setStrokeColor:](self->_innerRingLayer, "setStrokeColor:", [v3 CGColor]);

  id v6 = [(MUVerifiedLogoImageView *)self outerRingColor];
  uint64_t v4 = [v6 CGColor];
  objc_super v5 = [(MUVerifiedLogoImageView *)self layer];
  [v5 setBorderColor:v4];
}

- (UIColor)outerRingColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemBackgroundColor];
}

- (UIColor)innerRingColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] quaternarySystemFillColor];
}

- (void).cxx_destruct
{
}

@end