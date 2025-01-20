@interface PresentationBasedCollectionViewListCell
- (_TtC18HealthExperienceUI39PresentationBasedCollectionViewListCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI39PresentationBasedCollectionViewListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation PresentationBasedCollectionViewListCell

- (_TtC18HealthExperienceUI39PresentationBasedCollectionViewListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PresentationBasedCollectionViewListCell();
  return -[PresentationBasedCollectionViewListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  sub_1AD1CECFC();
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1AD73CDB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v11 = self;
  v12 = (void *)sub_1AD73CD80();
  v13 = (objc_class *)type metadata accessor for PresentationBasedCollectionViewListCell();
  v15.receiver = v11;
  v15.super_class = v13;
  [(PresentationBasedCollectionViewListCell *)&v15 _bridgedUpdateConfigurationUsingState:v12];

  (*(void (**)(char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v11->super.super.super.super.super.super.isa) + 0x58))(v10);
  uint64_t v14 = sub_1AD73CE60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 0, 1, v14);
  MEMORY[0x1B3E66140](v6);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC18HealthExperienceUI39PresentationBasedCollectionViewListCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PresentationBasedCollectionViewListCell();
  return [(PresentationBasedCollectionViewListCell *)&v5 initWithCoder:a3];
}

@end