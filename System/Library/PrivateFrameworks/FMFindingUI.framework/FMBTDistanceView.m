@interface FMBTDistanceView
- (_TtC11FMFindingUI16FMBTDistanceView)init;
- (_TtC11FMFindingUI16FMBTDistanceView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI16FMBTDistanceView)initWithFrame:(CGRect)a3;
@end

@implementation FMBTDistanceView

- (_TtC11FMFindingUI16FMBTDistanceView)init
{
  return (_TtC11FMFindingUI16FMBTDistanceView *)sub_24D2B5B20();
}

- (_TtC11FMFindingUI16FMBTDistanceView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D2B7584();
}

- (_TtC11FMFindingUI16FMBTDistanceView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI16FMBTDistanceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_distanceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_bottomRowVerticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_bottomRowStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_hintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_connectingActivityViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_connectingActivityView));
  id v3 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_style);
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_style);
  v5 = *(void **)((char *)&self->super.super.super._responderFlags
                + OBJC_IVAR____TtC11FMFindingUI16FMBTDistanceView_style);
  id v6 = v4;
}

@end