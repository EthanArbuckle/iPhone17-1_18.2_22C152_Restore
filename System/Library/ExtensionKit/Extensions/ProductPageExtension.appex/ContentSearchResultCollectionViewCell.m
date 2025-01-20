@interface ContentSearchResultCollectionViewCell
- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ContentSearchResultCollectionViewCell

- (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell *)sub_1002A3FF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_screenshots;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)type metadata accessor for LockupMediaView()) init];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_preferredImageSizes) = (Class)&_swiftEmptyDictionarySingleton;

  result = (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002A42E4();
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ContentSearchResultCollectionViewCell();
  v2 = (char *)v7.receiver;
  id v3 = [(ContentSearchResultCollectionViewCell *)&v7 prepareForReuse];
  sub_100529890((uint64_t)v3, v4, v5);
  id v6 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_screenshots];
  sub_100576C8C();
  objc_msgSend(v6, "setHidden:", 0, v7.receiver, v7.super_class);
}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_screenshots));

  swift_bridgeObjectRelease();
}

@end