@interface CollectionViewListDisclosureCellNonSelectable
- (_TtC18HealthExperienceUI45CollectionViewListDisclosureCellNonSelectable)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI45CollectionViewListDisclosureCellNonSelectable)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation CollectionViewListDisclosureCellNonSelectable

- (void)didMoveToSuperview
{
  v2 = self;
  sub_1AD62B5AC();
}

- (_TtC18HealthExperienceUI45CollectionViewListDisclosureCellNonSelectable)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CollectionViewListDisclosureCellNonSelectable();
  return -[CollectionViewListDisclosureCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI45CollectionViewListDisclosureCellNonSelectable)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CollectionViewListDisclosureCellNonSelectable();
  return [(CollectionViewListDisclosureCell *)&v5 initWithCoder:a3];
}

@end