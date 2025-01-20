@interface CollectionViewListDisclosureCell
- (NSString)description;
- (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CollectionViewListDisclosureCell

- (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell *)CollectionViewListDisclosureCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell *)CollectionViewListDisclosureCell.init(coder:)(a3);
}

- (void)dealloc
{
  v2 = self;
  CollectionViewListDisclosureCell.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1AD2075DC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell_item, (uint64_t (*)(void))sub_1AD1E1B04);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell____lazy_storage___textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell____lazy_storage___detailTextLabel));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell_detailTextObservation);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionViewListDisclosureCell();
  id v2 = v6.receiver;
  [(CollectionViewListDisclosureCell *)&v6 prepareForReuse];
  id v3 = sub_1AD517204();
  objc_msgSend(v3, sel_setText_, 0, v6.receiver, v6.super_class);

  id v4 = sub_1AD5172E4();
  objc_msgSend(v4, sel_setText_, 0);

  id v5 = sub_1AD5172E4();
  objc_msgSend(v5, sel_setHidden_, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1AD51B004(a3);
}

- (NSString)description
{
  id v2 = self;
  sub_1AD51B224();

  id v3 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)didMoveToSuperview
{
  id v2 = self;
  sub_1AD51B458();
}

@end