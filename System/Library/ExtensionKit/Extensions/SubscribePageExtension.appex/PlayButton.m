@interface PlayButton
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC22SubscribePageExtension10PlayButton)init;
- (_TtC22SubscribePageExtension10PlayButton)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension10PlayButton)initWithFrame:(CGRect)a3;
- (void)didTap;
- (void)layoutSubviews;
@end

@implementation PlayButton

- (_TtC22SubscribePageExtension10PlayButton)init
{
  return (_TtC22SubscribePageExtension10PlayButton *)sub_10049DD14();
}

- (_TtC22SubscribePageExtension10PlayButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10049E2C8();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (result.height < result.width) {
    result.double width = result.height;
  }
  if (result.width > 60.0) {
    result.double width = 60.0;
  }
  if (result.width <= 31.0) {
    result.double width = 0.0;
  }
  double width = result.width;
  result.height = width;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10049DFFC();
}

- (void)didTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension10PlayButton_tapActionBlock);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

- (_TtC22SubscribePageExtension10PlayButton)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension10PlayButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10PlayButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10PlayButton_glyphView));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension10PlayButton_tapActionBlock));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension10PlayButton_tapGestureRecognizer);
}

@end