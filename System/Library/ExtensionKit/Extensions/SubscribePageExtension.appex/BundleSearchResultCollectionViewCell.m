@interface BundleSearchResultCollectionViewCell
- (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BundleSearchResultCollectionViewCell

- (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell *)sub_10061A84C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_bundleView;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BundleView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BundleSearchResultCollectionViewCell();
  id v2 = v6.receiver;
  id v3 = [(BundleSearchResultCollectionViewCell *)&v6 prepareForReuse];
  sub_1001934B8((uint64_t)v3, v4, v5);
  sub_10072551C();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_10061AB68();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_lockupView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_bundleView);
}

@end