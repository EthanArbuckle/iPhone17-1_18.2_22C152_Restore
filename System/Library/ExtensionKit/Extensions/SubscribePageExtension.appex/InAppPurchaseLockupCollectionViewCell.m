@interface InAppPurchaseLockupCollectionViewCell
- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppPurchaseLockupCollectionViewCell

- (_TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell *)sub_10071797C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_spotlightView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_separatorView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_separator;
  uint64_t v8 = sub_100765A30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_isPartOfSpotlightShelf) = 0;
  id v9 = a3;

  result = (_TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100718388();
}

- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension23InAppPurchaseLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_spotlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_separatorView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension37InAppPurchaseLockupCollectionViewCell_separator, (uint64_t *)&unk_100945230);
}

@end