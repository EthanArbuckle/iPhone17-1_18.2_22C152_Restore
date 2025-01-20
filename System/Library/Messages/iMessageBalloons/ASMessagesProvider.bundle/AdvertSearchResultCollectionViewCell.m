@interface AdvertSearchResultCollectionViewCell
- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AdvertSearchResultCollectionViewCell

- (_TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell *)sub_6CBDE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell_advertsContentView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v6.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v6 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell_advertsContentView];
  sub_12DFAC((uint64_t)v3, v4, v5);
  sub_566774();
}

- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider21SmallSearchLockupView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell_advertsContentView) + OBJC_IVAR____TtC18ASMessagesProvider30AdvertsSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AdvertSearchResultCollectionViewCell_advertsContentView));
}

@end