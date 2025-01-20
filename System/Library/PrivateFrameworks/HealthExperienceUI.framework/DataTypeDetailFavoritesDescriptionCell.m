@interface DataTypeDetailFavoritesDescriptionCell
- (_TtC18HealthExperienceUI38DataTypeDetailFavoritesDescriptionCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI38DataTypeDetailFavoritesDescriptionCell)initWithFrame:(CGRect)a3;
@end

@implementation DataTypeDetailFavoritesDescriptionCell

- (_TtC18HealthExperienceUI38DataTypeDetailFavoritesDescriptionCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DataTypeDetailFavoritesDescriptionCell();
  return -[CollectionViewGroupedFooterCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI38DataTypeDetailFavoritesDescriptionCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DataTypeDetailFavoritesDescriptionCell();
  return [(CollectionViewGroupedFooterCell *)&v5 initWithCoder:a3];
}

@end