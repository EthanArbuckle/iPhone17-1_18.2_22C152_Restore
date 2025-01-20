@interface PlayButton
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC18ASMessagesProvider10PlayButton)init;
- (_TtC18ASMessagesProvider10PlayButton)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider10PlayButton)initWithFrame:(CGRect)a3;
- (void)didTap;
- (void)layoutSubviews;
@end

@implementation PlayButton

- (_TtC18ASMessagesProvider10PlayButton)init
{
  return (_TtC18ASMessagesProvider10PlayButton *)sub_1CFEAC();
}

- (_TtC18ASMessagesProvider10PlayButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D0460();
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
  sub_1D0194();
}

- (void)didTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider10PlayButton_tapActionBlock);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

- (_TtC18ASMessagesProvider10PlayButton)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider10PlayButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider10PlayButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider10PlayButton_glyphView));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider10PlayButton_tapActionBlock));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider10PlayButton_tapGestureRecognizer);
}

@end