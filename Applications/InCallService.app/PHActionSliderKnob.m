@interface PHActionSliderKnob
- (BOOL)isOpaque;
- (PHActionSliderKnob)initWithFrame:(CGRect)a3;
- (UIColor)knobColor;
- (void)drawRect:(CGRect)a3;
- (void)setKnobColor:(id)a3;
@end

@implementation PHActionSliderKnob

- (PHActionSliderKnob)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHActionSliderKnob;
  v3 = -[PHActionSliderKnob initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIColor whiteColor];
    knobColor = v3->_knobColor;
    v3->_knobColor = (UIColor *)v4;
  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  v6 = [(PHActionSliderKnob *)self knobColor];
  id v8 = v6;
  if (v6) {
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v6 CGColor]);
  }
  else {
    CGContextSetRGBFillColor(CurrentContext, 1.0, 1.0, 1.0, 1.0);
  }
  [(PHActionSliderKnob *)self bounds];
  CGContextFillRect(CurrentContext, v10);
  UIGraphicsPopContext();
  objc_super v7 = [(PHActionSliderKnob *)self layer];
  [v7 setCornerRadius:height * 0.5];
}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (void)setKnobColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end