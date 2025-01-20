@interface InteractiveTimelineItemCell
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation InteractiveTimelineItemCell

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  sub_2416333E8();
  sub_241631E08();
  swift_bridgeObjectRelease();
  sub_241631E08();
  sub_241632F68();

  v4 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell *)sub_241298F18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractiveTimelineItemCell();
  return [(InteractiveTimelineItemCell *)&v6 initWithCoder:a3];
}

- (void)awakeFromNib
{
  v2 = self;
  sub_241299270();
}

- (void).cxx_destruct
{
  sub_241299DB8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView);
}

@end