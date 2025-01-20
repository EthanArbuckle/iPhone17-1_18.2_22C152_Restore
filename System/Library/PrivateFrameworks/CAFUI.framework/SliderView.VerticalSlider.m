@interface SliderView.VerticalSlider
- (CGSize)intrinsicContentSize;
- (_TtCV5CAFUI10SliderView14VerticalSlider)initWithCoder:(id)a3;
- (_TtCV5CAFUI10SliderView14VerticalSlider)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SliderView.VerticalSlider

- (_TtCV5CAFUI10SliderView14VerticalSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SliderView.VerticalSlider.init(coder:)();
}

- (_TtCV5CAFUI10SliderView14VerticalSlider)initWithFrame:(CGRect)a3
{
  return (_TtCV5CAFUI10SliderView14VerticalSlider *)SliderView.VerticalSlider.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  SliderView.VerticalSlider.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCV5CAFUI10SliderView14VerticalSlider_slider);
  id v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
}

@end