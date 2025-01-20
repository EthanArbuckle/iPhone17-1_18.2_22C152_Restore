@interface ClimateZonePositionView
- (_TtC7Climate23ClimateZonePositionView)initWithCoder:(id)a3;
- (_TtC7Climate23ClimateZonePositionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ClimateZonePositionView

- (_TtC7Climate23ClimateZonePositionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100088668();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateZonePositionView();
  id v2 = v3.receiver;
  [(ClimateZonePositionView *)&v3 layoutSubviews];
  sub_10008637C();
}

- (_TtC7Climate23ClimateZonePositionView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate23ClimateZonePositionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100057C04((uint64_t)self + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_zone);
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_layoutInfo;
  uint64_t v4 = type metadata accessor for CAUVehicleLayoutInfo();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_activeButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___yConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___xConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___heightConstraint));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___widthConstraint);
}

@end