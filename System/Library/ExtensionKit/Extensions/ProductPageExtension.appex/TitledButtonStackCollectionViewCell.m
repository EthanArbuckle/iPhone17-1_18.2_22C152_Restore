@interface TitledButtonStackCollectionViewCell
- (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TitledButtonStackCollectionViewCell

- (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell *)sub_1001D9C50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = sub_10000D280(&qword_100955978);
  __chkstk_darwin(v5);
  v6 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_itemLayoutContext;
  uint64_t v7 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_lineBreaks;
  uint64_t v9 = sub_10000D280(&qword_100955968);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_buttons) = (Class)_swiftEmptyArrayStorage;
  type metadata accessor for RoundedTitledButton();
  id v10 = a3;
  sub_100779320();
  sub_1001DB2CC();
  sub_10077A000();

  result = (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001DAB8C();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitledButtonStackCollectionViewCell();
  id v2 = v3.receiver;
  [(TitledButtonStackCollectionViewCell *)&v3 prepareForReuse];
  sub_1001DA044();
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_lineBreaks, (uint64_t *)&unk_100955988);
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_reusePool;
  uint64_t v4 = sub_10000D280(&qword_1009559A8);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end