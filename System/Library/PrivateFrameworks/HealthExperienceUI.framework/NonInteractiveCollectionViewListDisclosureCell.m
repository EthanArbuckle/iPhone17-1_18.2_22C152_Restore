@interface NonInteractiveCollectionViewListDisclosureCell
- (_TtC18HealthExperienceUI46NonInteractiveCollectionViewListDisclosureCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI46NonInteractiveCollectionViewListDisclosureCell)initWithFrame:(CGRect)a3;
@end

@implementation NonInteractiveCollectionViewListDisclosureCell

- (_TtC18HealthExperienceUI46NonInteractiveCollectionViewListDisclosureCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NonInteractiveCollectionViewListDisclosureCell();
  v7 = -[CollectionViewListDisclosureCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(NonInteractiveCollectionViewListDisclosureCell *)v7 setUserInteractionEnabled:0];
  return v7;
}

- (_TtC18HealthExperienceUI46NonInteractiveCollectionViewListDisclosureCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NonInteractiveCollectionViewListDisclosureCell();
  return [(CollectionViewListDisclosureCell *)&v5 initWithCoder:a3];
}

@end