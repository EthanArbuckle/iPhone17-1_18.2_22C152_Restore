@interface TitledButtonStackCollectionViewCell
- (_TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TitledButtonStackCollectionViewCell

- (_TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell *)sub_1000C2DA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = sub_10000FB44(&qword_100937878);
  __chkstk_darwin(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell_itemLayoutContext;
  uint64_t v8 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell_lineBreaks;
  uint64_t v10 = sub_10000FB44(&qword_100934F68);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell_buttons) = (Class)_swiftEmptyArrayStorage;
  type metadata accessor for RoundedTitledButton();
  id v11 = a3;
  sub_100764CC0();
  sub_1000C4424();
  sub_1007659A0();

  result = (_TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C3CE4();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitledButtonStackCollectionViewCell();
  id v2 = v3.receiver;
  [(TitledButtonStackCollectionViewCell *)&v3 prepareForReuse];
  sub_1000C319C();
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell_lineBreaks, &qword_100934F58);
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35TitledButtonStackCollectionViewCell_reusePool;
  uint64_t v4 = sub_10000FB44(&qword_100937898);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end