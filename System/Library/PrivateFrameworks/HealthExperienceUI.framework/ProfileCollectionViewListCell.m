@interface ProfileCollectionViewListCell
- (_TtC18HealthExperienceUI29ProfileCollectionViewListCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29ProfileCollectionViewListCell)initWithFrame:(CGRect)a3;
@end

@implementation ProfileCollectionViewListCell

- (_TtC18HealthExperienceUI29ProfileCollectionViewListCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29ProfileCollectionViewListCell *)ProfileCollectionViewListCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29ProfileCollectionViewListCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI29ProfileCollectionViewListCell *)ProfileCollectionViewListCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileCollectionViewListCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileCollectionViewListCell____lazy_storage___textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileCollectionViewListCell____lazy_storage___detailTextLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end