@interface AppEventTodayCardCollectionViewCell
- (_TtC18ASMessagesProvider35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applySizeCategoryUpdates;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventTodayCardCollectionViewCell

- (_TtC18ASMessagesProvider35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider35AppEventTodayCardCollectionViewCell *)sub_67AF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applySizeCategoryUpdates
{
  v2 = self;
  sub_680F4();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(StoryCardCollectionViewCell *)&v3 layoutSubviews];
  sub_68644();
  sub_68940();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_6962C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider35AppEventTodayCardCollectionViewCell_formattedDateView));
}

@end