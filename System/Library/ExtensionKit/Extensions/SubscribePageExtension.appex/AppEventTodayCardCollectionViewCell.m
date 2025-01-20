@interface AppEventTodayCardCollectionViewCell
- (_TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applySizeCategoryUpdates;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell *)sub_1004DE018(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applySizeCategoryUpdates
{
  v2 = self;
  sub_1004DE614();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(StoryCardCollectionViewCell *)&v3 layoutSubviews];
  sub_1004DEA80();
  sub_1004DED7C();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1004DFA68();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell_formattedDateView));
}

@end