@interface PKAngularOpacitySliderKnobView
- (CALayer)backgroundCircleLayer;
- (PKAngularOpacitySliderKnobView)initWithFrame:(CGRect)a3;
- (void)setBackgroundCircleLayer:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation PKAngularOpacitySliderKnobView

- (PKAngularOpacitySliderKnobView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKAngularOpacitySliderKnobView;
  v3 = -[PKAngularOpacitySliderKnobView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKAngularOpacitySliderKnobView *)v3 layer];
    uint64_t v6 = [MEMORY[0x1E4F39C88] layer];
    backgroundCircleLayer = v4->_backgroundCircleLayer;
    v4->_backgroundCircleLayer = (CALayer *)v6;

    [v5 addSublayer:v4->_backgroundCircleLayer];
    [(CALayer *)v4->_backgroundCircleLayer setBorderWidth:4.0];
    id v8 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CALayer setBorderColor:](v4->_backgroundCircleLayer, "setBorderColor:", [v8 CGColor]);

    [(CALayer *)v4->_backgroundCircleLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
    id v9 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v9, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v5 setShadowRadius:1.0];
    LODWORD(v10) = 1036831949;
    [v5 setShadowOpacity:v10];
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PKAngularOpacitySliderKnobView;
  -[PKAngularOpacitySliderKnobView setFrame:](&v18, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKAngularOpacitySliderKnobView *)self bounds];
  double v8 = v7;
  double v9 = v4;
  double v10 = v5;
  double v11 = v6;
  if (v5 >= v6) {
    double v12 = v6;
  }
  else {
    double v12 = v5;
  }
  CGFloat v13 = v12 * 0.5;
  double v14 = v8;
  v15 = CGPathCreateWithRoundedRect(*(CGRect *)(&v4 - 1), v13, v13, 0);
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v15, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
  CGPathRelease(v15);
  v17 = [(PKAngularOpacitySliderKnobView *)self layer];
  [v17 setShadowPath:CopyByStrokingPath];

  CGPathRelease(CopyByStrokingPath);
  -[CALayer setFrame:](self->_backgroundCircleLayer, "setFrame:", v8, v9, v10, v11);
  [(CALayer *)self->_backgroundCircleLayer setCornerRadius:v13];
}

- (CALayer)backgroundCircleLayer
{
  return self->_backgroundCircleLayer;
}

- (void)setBackgroundCircleLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end