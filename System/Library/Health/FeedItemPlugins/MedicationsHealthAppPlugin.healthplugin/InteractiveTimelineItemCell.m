@interface InteractiveTimelineItemCell
- (NSString)description;
- (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell)initWithFrame:(CGRect)a3;
@end

@implementation InteractiveTimelineItemCell

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  sub_241161A00();
  sub_241160860();
  swift_bridgeObjectRelease();
  sub_241160860();
  sub_241161690();

  v4 = (void *)sub_2411606F0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell *)sub_2410FF42C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractiveTimelineItemCell();
  return [(InteractiveTimelineItemCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_2410616A4((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView);
}

@end