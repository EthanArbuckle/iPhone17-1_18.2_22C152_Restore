@interface ShelfDisplayingFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout)init;
- (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation ShelfDisplayingFlowLayout

- (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout)init
{
  return (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout *)sub_1005975B8();
}

- (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension25ShelfDisplayingFlowLayout_multiColumnMinYBySection;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1006148CC((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v6 = OBJC_IVAR____TtC20ProductPageExtension25ShelfDisplayingFlowLayout_multiColumnOrigins;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_100612984((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC20ProductPageExtension25ShelfDisplayingFlowLayout *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  id v2 = v3.receiver;
  [(ShelfDisplayingFlowLayout *)&v3 prepareLayout];
  sub_100596C88();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  id v8 = sub_1005977C8(x, y, width, height);

  if (v8)
  {
    sub_100019840(0, (unint64_t *)&qword_10094B6C0);
    v9.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_10076A5F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v8 = self;
  id v9 = sub_100597CFC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_10076A5F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10077BCB0();
  uint64_t v11 = v10;
  sub_10076A530();
  if (v9 == 0xD00000000000001FLL && v11 == 0x80000001007F3250 || (sub_10077D230() & 1) != 0)
  {
    v12 = self;
    id v13 = sub_10059687C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = self;
    NSString v15 = sub_10077BC80();
    Class isa = sub_10076A4F0().super.isa;
    v17 = (objc_class *)type metadata accessor for ShelfDisplayingFlowLayout();
    v19.receiver = v14;
    v19.super_class = v17;
    id v13 = [(ShelfDisplayingFlowLayout *)&v19 layoutAttributesForDecorationViewOfKind:v15 atIndexPath:isa];

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = [(ShelfDisplayingFlowLayout *)v7 collectionView];
  if (v8)
  {
    uint64_t v9 = v8;
    [v8 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v11 != width) {
      goto LABEL_7;
    }
  }
  else
  {
    double v13 = 0.0;
    if (width != 0.0)
    {
LABEL_7:

      return 1;
    }
  }
  if (v13 != height) {
    goto LABEL_7;
  }
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  BOOL v14 = -[ShelfDisplayingFlowLayout shouldInvalidateLayoutForBoundsChange:](&v16, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height);

  return v14;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = sub_10059825C(x, y, width, height);

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end