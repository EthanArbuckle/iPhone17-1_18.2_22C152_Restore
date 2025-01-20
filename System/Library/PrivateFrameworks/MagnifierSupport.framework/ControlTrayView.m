@interface ControlTrayView
- (_TtC16MagnifierSupport15ControlTrayView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport15ControlTrayView)initWithFrame:(CGRect)a3;
@end

@implementation ControlTrayView

- (_TtC16MagnifierSupport15ControlTrayView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport15ControlTrayView_controlSubset) = 1;
  id v4 = a3;

  result = (_TtC16MagnifierSupport15ControlTrayView *)sub_23594A968();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport15ControlTrayView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport15ControlTrayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport15ControlTrayView_collectionView));
}

@end