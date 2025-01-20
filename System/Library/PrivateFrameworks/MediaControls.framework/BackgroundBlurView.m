@interface BackgroundBlurView
- (_TtC13MediaControls18BackgroundBlurView)initWithCoder:(id)a3;
- (_TtC13MediaControls18BackgroundBlurView)initWithFrame:(CGRect)a3;
@end

@implementation BackgroundBlurView

- (_TtC13MediaControls18BackgroundBlurView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls18BackgroundBlurView *)sub_1AE93F6E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls18BackgroundBlurView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE93FE28();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls18BackgroundBlurView_backdropLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls18BackgroundBlurView_clipMaskLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls18BackgroundBlurView_backdropBlurFilter);
}

@end