@interface AdvertSearchResultCollectionViewCell
- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AdvertSearchResultCollectionViewCell

- (_TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell *)sub_100278CD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell_advertsContentView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v6.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v6 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell_advertsContentView];
  sub_1001934B8((uint64_t)v3, v4, v5);
  sub_100656328();
}

- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension21SmallSearchLockupView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell_advertsContentView) + OBJC_IVAR____TtC22SubscribePageExtension30AdvertsSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AdvertSearchResultCollectionViewCell_advertsContentView));
}

@end