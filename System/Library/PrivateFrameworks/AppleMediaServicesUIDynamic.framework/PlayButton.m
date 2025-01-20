@interface PlayButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC27AppleMediaServicesUIDynamic10PlayButton)init;
- (_TtC27AppleMediaServicesUIDynamic10PlayButton)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic10PlayButton)initWithFrame:(CGRect)a3;
- (void)didTap;
- (void)layoutSubviews;
@end

@implementation PlayButton

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)init
{
  return (_TtC27AppleMediaServicesUIDynamic10PlayButton *)sub_1BF4390B8();
}

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF43941C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = sub_1BF439520(a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BF439550();
}

- (void)didTap
{
  v2 = self;
  sub_1BF43967C();
}

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_glyphView));
  sub_1BF3CBCFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapActionBlock));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapGestureRecognizer);
}

@end