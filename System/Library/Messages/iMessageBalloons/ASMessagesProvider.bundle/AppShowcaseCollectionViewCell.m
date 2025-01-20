@interface AppShowcaseCollectionViewCell
- (_TtC18ASMessagesProvider29AppShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppShowcaseCollectionViewCell

- (_TtC18ASMessagesProvider29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider29AppShowcaseCollectionViewCell *)sub_43D1D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider29AppShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider29AppShowcaseCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC18ASMessagesProvider29AppShowcaseCollectionViewCell_lockupView;
  id v8 = objc_allocWithZone((Class)type metadata accessor for AppShowcaseLockupView());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  swift_unknownObjectWeakInit();
  v10 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider29AppShowcaseCollectionViewCell_showcaseType;
  uint64_t v11 = enum case for AppShowcaseType.large(_:);
  uint64_t v12 = sub_76D310();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);

  result = (_TtC18ASMessagesProvider29AppShowcaseCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_43CEB8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_43D85C();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider29AppShowcaseCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29AppShowcaseCollectionViewCell_lockupView));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider29AppShowcaseCollectionViewCell_showcaseType;
  uint64_t v4 = sub_76D310();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end