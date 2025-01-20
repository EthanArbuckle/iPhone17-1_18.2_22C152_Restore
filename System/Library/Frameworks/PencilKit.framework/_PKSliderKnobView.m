@interface _PKSliderKnobView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)knobImageView;
- (_PKSliderKnobView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _PKSliderKnobView

- (_PKSliderKnobView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_PKSliderKnobView;
  v3 = -[_PKSliderKnobView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
  v5 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UISliderKnob"];
  uint64_t v6 = [v4 initWithImage:v5];
  knobImageView = v3->_knobImageView;
  v3->_knobImageView = (UIImageView *)v6;

  [(_PKSliderKnobView *)v3 addSubview:v3->_knobImageView];
  [(_PKSliderKnobView *)v3 setExclusiveTouch:1];
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 28.0;
  double v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_PKSliderKnobView;
  [(_PKSliderKnobView *)&v15 layoutSubviews];
  double v3 = [(_PKSliderKnobView *)self knobImageView];
  double v4 = [v3 image];
  [v4 size];

  [(_PKSliderKnobView *)self bounds];
  UIRectGetCenter();
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  UIRectCenteredAboutPointScale();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(_PKSliderKnobView *)self knobImageView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
}

- (UIImageView)knobImageView
{
  return self->_knobImageView;
}

- (void).cxx_destruct
{
}

@end