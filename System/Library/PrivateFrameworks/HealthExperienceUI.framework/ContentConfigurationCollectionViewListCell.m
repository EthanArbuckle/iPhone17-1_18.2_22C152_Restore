@interface ContentConfigurationCollectionViewListCell
- (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation ContentConfigurationCollectionViewListCell

- (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell_item;
  v9 = (objc_class *)type metadata accessor for ContentConfigurationCollectionViewListCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[PresentationBasedCollectionViewListCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD1CE6F0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell *)sub_1AD55DE84((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell_item, type metadata accessor for ContentConfigurationCollectionViewListCell);
}

- (void).cxx_destruct
{
}

@end