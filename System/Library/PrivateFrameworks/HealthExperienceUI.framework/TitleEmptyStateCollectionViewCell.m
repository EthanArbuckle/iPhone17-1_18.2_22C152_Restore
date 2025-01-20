@interface TitleEmptyStateCollectionViewCell
- (_TtC18HealthExperienceUI33TitleEmptyStateCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33TitleEmptyStateCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation TitleEmptyStateCollectionViewCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleEmptyStateCollectionViewCell();
  id v2 = v3.receiver;
  [(TitleEmptyStateCollectionViewCell *)&v3 prepareForReuse];
  objc_msgSend(v2, sel_setUserInteractionEnabled_, 0, v3.receiver, v3.super_class);
}

- (_TtC18HealthExperienceUI33TitleEmptyStateCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TitleEmptyStateCollectionViewCell();
  return -[ContentConfigurationCollectionViewListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI33TitleEmptyStateCollectionViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TitleEmptyStateCollectionViewCell();
  return [(ContentConfigurationCollectionViewListCell *)&v5 initWithCoder:a3];
}

@end