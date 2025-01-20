@interface ProductDescriptionCollectionViewCell
- (_TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductDescriptionCollectionViewCell

- (_TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell *)sub_10071D6A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10071DB94();
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell_bodyTextView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension36ProductDescriptionCollectionViewCell_developerLinkView);
}

@end