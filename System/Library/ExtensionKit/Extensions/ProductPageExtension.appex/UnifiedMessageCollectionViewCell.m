@interface UnifiedMessageCollectionViewCell
- (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation UnifiedMessageCollectionViewCell

- (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell *)sub_100261A18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_placement);
  void *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView) = 0;
  id v8 = a3;

  result = (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for UnifiedMessageCollectionViewCell(0);
  v2 = v7.receiver;
  [(UnifiedMessageCollectionViewCell *)&v7 layoutSubviews];
  v3 = *(void **)((char *)v2
                + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView);
  if (v3)
  {
    v4 = *(void (**)(id, uint64_t))((swift_isaMask & *v2) + 0x88);
    id v5 = v3;
    v4(v5, v6);
    objc_msgSend(v5, "setFrame:", v7.receiver, v7.super_class);

    v2 = v5;
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UnifiedMessageCollectionViewCell(0);
  v2 = (char *)v3.receiver;
  [(UnifiedMessageCollectionViewCell *)&v3 prepareForReuse];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView], "removeFromSuperview", v3.receiver, v3.super_class);
  sub_100262758(0);
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_itemLayoutContext);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView);
}

@end