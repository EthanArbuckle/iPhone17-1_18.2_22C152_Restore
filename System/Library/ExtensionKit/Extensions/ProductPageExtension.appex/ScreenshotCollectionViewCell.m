@interface ScreenshotCollectionViewCell
- (_TtC20ProductPageExtension28ScreenshotCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ScreenshotCollectionViewCell

- (_TtC20ProductPageExtension28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28ScreenshotCollectionViewCell *)sub_10037EA5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28ScreenshotCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_artworkDisplaySize;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC20ProductPageExtension28ScreenshotCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10037ED04();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10037EE14();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_itemLayoutContext);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension28ScreenshotCollectionViewCell_borderedScreenshotView);
}

@end