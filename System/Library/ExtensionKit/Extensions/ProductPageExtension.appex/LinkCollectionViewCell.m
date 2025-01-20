@interface LinkCollectionViewCell
- (_TtC20ProductPageExtension22LinkCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension22LinkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation LinkCollectionViewCell

- (_TtC20ProductPageExtension22LinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension22LinkCollectionViewCell *)sub_10022D2B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension22LinkCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell____lazy_storage___standardLinkView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell____lazy_storage___presentationLinkView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell_currentLinkView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC20ProductPageExtension22LinkCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10022D4EC();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(LinkCollectionViewCell *)&v3 prepareForReuse];
  sub_10022D0A4(0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell____lazy_storage___standardLinkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell____lazy_storage___presentationLinkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell_currentLinkView));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension22LinkCollectionViewCell_itemLayoutContext;

  sub_1000105B0((uint64_t)v3);
}

@end