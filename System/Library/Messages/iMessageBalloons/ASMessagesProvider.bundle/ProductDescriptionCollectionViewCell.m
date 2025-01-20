@interface ProductDescriptionCollectionViewCell
- (_TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductDescriptionCollectionViewCell

- (_TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell *)sub_633CA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_63418C();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell_bodyTextView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider36ProductDescriptionCollectionViewCell_developerLinkView);
}

@end