@interface GradientColorSlider
- (_TtC11EmojiPoster19GradientColorSlider)initWithCoder:(id)a3;
- (_TtC11EmojiPoster19GradientColorSlider)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)leftColorDidPanWithGr:(id)a3;
- (void)leftColorWasTappedWithGr:(id)a3;
- (void)rightColorDidPanWithGr:(id)a3;
- (void)rightColorWasTappedWithGr:(id)a3;
@end

@implementation GradientColorSlider

- (_TtC11EmojiPoster19GradientColorSlider)initWithFrame:(CGRect)a3
{
  return (_TtC11EmojiPoster19GradientColorSlider *)sub_20B8F8190(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11EmojiPoster19GradientColorSlider)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster19GradientColorSlider *)sub_20B8F83C8(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20B8F8950();
}

- (void)leftColorDidPanWithGr:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B8F8AA8(v4);
}

- (void)rightColorDidPanWithGr:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B8F8D6C(v4);
}

- (void)leftColorWasTappedWithGr:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B8F9230();
}

- (void)rightColorWasTappedWithGr:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B8F9414();
}

- (void).cxx_destruct
{
  sub_20B8F966C((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColorTapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColorTapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColorPanGesture));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColorPanGesture);
}

@end