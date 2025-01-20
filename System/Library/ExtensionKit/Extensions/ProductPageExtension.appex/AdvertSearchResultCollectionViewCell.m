@interface AdvertSearchResultCollectionViewCell
- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AdvertSearchResultCollectionViewCell

- (_TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell *)sub_100595550(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  result = (_TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell_advertsContentView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v6.receiver;
  [(AdvertSearchResultCollectionViewCell *)&v6 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell_advertsContentView];
  sub_100529890((uint64_t)v3, v4, v5);
  sub_100576C8C();
}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell_advertsContentView) + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AdvertSearchResultCollectionViewCell_advertsContentView));
}

@end