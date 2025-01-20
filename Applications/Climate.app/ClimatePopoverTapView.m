@interface ClimatePopoverTapView
- (_TtC7Climate21ClimatePopoverTapView)init;
- (_TtC7Climate21ClimatePopoverTapView)initWithCoder:(id)a3;
- (_TtC7Climate21ClimatePopoverTapView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ClimatePopoverTapView

- (_TtC7Climate21ClimatePopoverTapView)init
{
  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler);
  v4 = (objc_class *)type metadata accessor for ClimatePopoverTapView();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[ClimatePopoverTapView initWithFrame:](&v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC7Climate21ClimatePopoverTapView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC7Climate21ClimatePopoverTapView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v4 = *(void (**)(void))((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler);
  if (v4)
  {
    id v6 = a4;
    v7 = self;
    sub_10001C6B0((uint64_t)v4);
    v4(0);
    sub_100005690((uint64_t)v4);
  }

  return 0;
}

- (_TtC7Climate21ClimatePopoverTapView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate21ClimatePopoverTapView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005690(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler));
}

@end