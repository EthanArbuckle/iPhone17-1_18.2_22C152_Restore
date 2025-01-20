@interface ProductMediaItemCollectionViewCell
- (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ProductMediaItemCollectionViewCell

- (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell *)sub_100412FD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_shouldForcePortrait) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_artworkDisplaySize;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;
  sub_100770F90();
  swift_unknownObjectWeakInit();

  result = (_TtC20ProductPageExtension34ProductMediaItemCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1004133F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10041358C();
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_borderedScreenshotView));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34ProductMediaItemCollectionViewCell_configuration;
  uint64_t v4 = sub_100771050();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectWeakDestroy();
}

@end