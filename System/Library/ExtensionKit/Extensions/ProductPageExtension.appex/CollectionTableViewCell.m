@interface CollectionTableViewCell
- (_TtC20ProductPageExtension23CollectionTableViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23CollectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CollectionTableViewCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  id v2 = v3.receiver;
  [(CollectionTableViewCell *)&v3 prepareForReuse];
  objc_msgSend(v2, "setSelectionStyle:", 0, v3.receiver, v3.super_class);
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  id v2 = (char *)v14.receiver;
  [(CollectionTableViewCell *)&v14 layoutSubviews];
  objc_super v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension23CollectionTableViewCell_collectionView];
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, "contentView", v14.receiver, v14.super_class);
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
    id v2 = v4;
  }
}

- (_TtC20ProductPageExtension23CollectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_10077BCB0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC20ProductPageExtension23CollectionTableViewCell *)sub_1002AFF90(a3, (uint64_t)a4, v6);
}

- (_TtC20ProductPageExtension23CollectionTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23CollectionTableViewCell_dataSource) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23CollectionTableViewCell_collectionView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  return [(CollectionTableViewCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension23CollectionTableViewCell_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23CollectionTableViewCell_collectionView);
}

@end