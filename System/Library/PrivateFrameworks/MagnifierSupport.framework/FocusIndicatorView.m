@interface FocusIndicatorView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MagnifierSupport18FocusIndicatorView)init;
- (_TtC16MagnifierSupport18FocusIndicatorView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport18FocusIndicatorView)initWithFrame:(CGRect)a3;
@end

@implementation FocusIndicatorView

- (_TtC16MagnifierSupport18FocusIndicatorView)init
{
  return (_TtC16MagnifierSupport18FocusIndicatorView *)sub_2358F35BC();
}

- (_TtC16MagnifierSupport18FocusIndicatorView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18FocusIndicatorView____lazy_storage___reticle) = 0;
  id v4 = a3;

  result = (_TtC16MagnifierSupport18FocusIndicatorView *)sub_23594A968();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = sub_2358F3514();
  objc_msgSend(v3, sel_intrinsicContentSize);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(FocusIndicatorView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC16MagnifierSupport18FocusIndicatorView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MagnifierSupport18FocusIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18FocusIndicatorView____lazy_storage___reticle));
}

@end