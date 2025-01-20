@interface RollingClockView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11ClockPoster16RollingClockView)initWithCoder:(id)a3;
- (_TtC11ClockPoster16RollingClockView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RollingClockView

- (_TtC11ClockPoster16RollingClockView)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_24A0563E8();
  uint64_t v5 = OBJC_IVAR____TtC11ClockPoster16RollingClockView_model;
  type metadata accessor for RollingClockViewModel();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_249F6491C();

  result = (_TtC11ClockPoster16RollingClockView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RollingClockView();
  [(RollingClockView *)&v2 layoutSubviews];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster16RollingClockView_viewController);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_view);
  if (v7)
  {
    v10 = v7;
    objc_msgSend(v7, sel_sizeThatFits_, width, height);
    double v12 = v11;
    double v14 = v13;

    double v8 = v12;
    double v9 = v14;
  }
  else
  {
    __break(1u);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (_TtC11ClockPoster16RollingClockView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC11ClockPoster16RollingClockView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11ClockPoster16RollingClockView_timeZone;
  uint64_t v4 = sub_24A0563F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster16RollingClockView_viewController));

  swift_release();
}

@end