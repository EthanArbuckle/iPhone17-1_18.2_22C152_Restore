@interface TitledButtonStackCollectionViewCell
- (_TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TitledButtonStackCollectionViewCell

- (_TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell *)sub_1E9EC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = sub_FD50(&qword_95C218);
  __chkstk_darwin(v5);
  v6 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell_itemLayoutContext;
  uint64_t v7 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell_lineBreaks;
  uint64_t v9 = sub_FD50(&qword_95C208);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell_buttons) = (Class)_swiftEmptyArrayStorage;
  type metadata accessor for RoundedTitledButton();
  id v10 = a3;
  sub_77AD30();
  sub_1EB544();
  sub_77BA10();

  result = (_TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1EAE04();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitledButtonStackCollectionViewCell();
  id v2 = v3.receiver;
  [(TitledButtonStackCollectionViewCell *)&v3 prepareForReuse];
  sub_1EA2BC();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell_lineBreaks, (uint64_t *)&unk_95C228);
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider35TitledButtonStackCollectionViewCell_reusePool;
  uint64_t v4 = sub_FD50(&qword_95C248);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end