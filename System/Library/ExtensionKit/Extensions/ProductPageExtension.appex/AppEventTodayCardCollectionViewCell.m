@interface AppEventTodayCardCollectionViewCell
- (_TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applySizeCategoryUpdates;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventTodayCardCollectionViewCell

- (_TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell *)sub_1000635B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applySizeCategoryUpdates
{
  v2 = self;
  sub_100063BB4();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(StoryCardCollectionViewCell *)&v3 layoutSubviews];
  sub_100064104();
  sub_100064400();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1000650EC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell_formattedDateView));
}

@end